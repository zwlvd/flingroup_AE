<template>
    <div class="app-container">
        <!-- 左侧视频区域 -->
        <div class="left-container">
            <!-- 案例视频区域 -->
            <div class="video-box" v-if="formData.videofield == 1">
                <video ref="caseVideo" controls :src="caseVideoSrc" @play="onPlay" @pause="onPause"></video>
                <p>案例视频</p>
                <el-button @click="onPlayClick">播放/暂停</el-button>
            </div>

            <!-- 实时检测视频区域 -->
            <div class="video-box" v-if="formData.videofield == 2">
                <video ref="liveVideo" controls :src="liveVideoSrc"></video>
                <p>实时检测视频</p>
            </div>
            <!-- 案例视频和检测视频同时播放 -->
            <div class="video-box" v-if="formData.videofield == 3">
                <div class="dual-video">
                    <div>
                        <video ref="caseVideo" controls :src="caseVideoSrc" style="width: 100%;"></video>
                        <p>案例视频</p>
                    </div>
                    <div>
                        <video ref="liveVideo" controls :src="liveVideoSrc" style="width: 100%;"></video>
                        <p>实时检测视频</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 右侧功能区域 -->
        <div class="right-container">
            <el-container>
                <el-header
                    style="text-align: center; font-weight: bold; font-family: var(--el-font-family);font-size: 24px;">自动驾驶对抗安全测试</el-header>
                <!-- 案例视频选择 -->
                <el-form ref="elForm" :model="formData" :rules="rules" size="large" label-width="100px">
                    <el-row :gutter="15">
                        <el-form-item label="案例视频" prop="casefield">
                            <el-select v-model="formData.casefield" placeholder="请选择案例" clearable
                                :style="{ width: '100%' }" @change="updateCaseResult">
                                <el-option v-for="(item, index) in caseOptions" :key="index" :label="item.label"
                                    :value="item.value" :disabled="item.disabled"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-row>
                    <el-form-item size="large">
                        <el-button type="primary" @click="submitCaseForm">选择案例</el-button>
                        <el-button @click="resetCaseForm">重置</el-button>
                    </el-form-item>
                </el-form>

                <!-- 检测算法选择 -->
                <el-form ref="elForm" :model="formData" :rules="rules" size="large" label-width="100px">
                    <el-row :gutter="15">
                        <el-form-item label="检测算法" prop="modelfield">
                            <el-select v-model="formData.modelfield" placeholder="请选择检测算法" clearable
                                :style="{ width: '100%' }" @change="updateModelResult">
                                <el-option v-for="(item, index) in modelOptions" :key="index" :label="item.label"
                                    :value="item.value" :disabled="item.disabled"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-row>
                    <el-form-item size="large">
                        <el-button type="primary" @click="submitModelForm">开始检测</el-button>
                        <el-button @click="resetModelForm">重置</el-button>
                    </el-form-item>
                </el-form>
                <!-- 视频选择 -->
                <el-form ref="elForm" :model="formData" :rules="rules" size="large" label-width="100px">
                    <el-form-item label="视频选择" prop="videofield">
                        <el-radio-group v-model="formData.videofield" size="large">
                            <el-radio v-for="(item, index) in videofieldOptions" :key="index" :label="item.value"
                                :disabled="item.disabled">{{ item.label }}</el-radio>
                        </el-radio-group>
                    </el-form-item>
                </el-form>
            </el-container>

            <el-container>
                <el-header
                    style="text-align: center; font-weight: bold; font-family: var(--el-font-family);font-size: 24px;">检测结果</el-header>
                <el-container style=" justify-content: center;">
                    <!-- 结果展示 -->
                    <el-form :model="formData" size="large" label-position="top" style="width: 600px;font-size: 24px;">
                        <el-form-item label="检测案例">
                            <el-input v-model="formData.resultfield.case" :readonly="true" />
                        </el-form-item>

                        <el-form-item label="检测算法">
                            <el-input v-model="formData.resultfield.model" :readonly="true" />
                        </el-form-item>

                        <el-form-item label="攻击成功率">
                            <el-input v-model="formData.resultfield.rate" :readonly="true" />
                        </el-form-item>

                        <el-form-item label="检测状态">
                            <el-tag size="small">{{ formData.resultfield.status }}</el-tag>
                        </el-form-item>

                        <el-form-item label="bounding box">
                            <el-input v-model="formData.resultfield.bbox" :readonly="true" />
                        </el-form-item>
                    </el-form>

                </el-container>
            </el-container>
        </div>
    </div>
</template>

<script>
import { listCase, getVideoCase } from "@/api/main/case";
import { listModel, getModel } from "@/api/main/model";


export default {
    data() {
        return {
            isDetecting: true, // 是否开始检测
            caseVideoSrc: '', // 案例视频的路径
            liveVideoSrc: 'http://localhost:18080/profile/upload/2024/11/21/视频1_20241121194430A001.mov', // 实时检测视频的路径
            newWindow: null, // 保存新窗口引用
            selectedCase: null, // 当前选择的案例视频

            // 检测算法列表
            selectedAlgorithm: null, // 当前选择的算法

            // 检测结果
            detectionResults: [],

            formData: {
                casefield: undefined,
                modelfield: undefined,
                videofield: 1,
                resultfield: {
                    case: "案例2",
                    model: "case2.mp4",
                    rate: "0.888",
                    status: "检测中",
                    bbox: "0.9"
                },
            },
            rules: {
                casefield: [{
                    required: true,
                    message: '请选择下拉选择',
                    trigger: 'change'
                }],
                modelfield: [{
                    required: true,
                    message: '请选择下拉选择',
                    trigger: 'change'
                }],
                videofield: [{
                    required: true,
                    message: '单选框组不能为空',
                    trigger: 'change'
                }],
            },
            caseOptions: [],
            modelOptions: [],
            videofieldOptions: [
                { label: "案例视频", value: 1 },
                { label: "检测视频", value: 2 },
                { label: "案例+检测视频", value: 3 }
            ],
        };
    },
    created() {
        this.fetchCaseOptions(); // 调用方法获取案例选项
        this.fetchModelOptions(); // 调用方法获取模型选项
    },
    methods: {
        // 案例视频改变事件
        onCaseChange() {
            const video = this.$refs.caseVideo;
            video.src = this.selectedCase;
            video.play();
        },
        // 检测算法改变事件
        onAlgorithmChange() {
            this.startDetection();
        },
        // 点击播放/暂停按钮
        onPlayClick() {
            const video = this.$refs.caseVideo;
            if (video.paused) {
                video.play();
            } else {
                video.pause();
            }
        },

        // 父窗口播放事件
        onPlay() {
            if (this.newWindow && this.newWindow.videoElement) {
                this.newWindow.videoElement.play(); // 同步新窗口播放
            }
        },

        // 父窗口暂停事件
        onPause() {
            if (this.newWindow && this.newWindow.videoElement) {
                this.newWindow.videoElement.pause(); // 同步新窗口暂停
            }
        },

        // 父窗口时间更新事件
        onTimeUpdate() {
            const video = this.$refs.caseVideo;
            if (this.newWindow && this.newWindow.videoElement) {
                const currentTime = video.currentTime;
                this.newWindow.videoElement.currentTime = currentTime; // 同步进度
            }
        },

        // 打开新窗口并同步播放
        openVideoInNewWindow(videoSrc) {
            const newWindow = window.open('', '_blank', 'width=800,height=600');
            newWindow.document.write(`
                <html>
                    <head><title>同步播放案例视频</title></head>
                    <body>
                        <video id="newVideo" controls style="width: 100%">
                            <source src="${videoSrc}" type="video/mp4">
                        </video>
                    </body>
                </html>
            `);
            newWindow.onload = () => {
                const video = this.$refs.caseVideo; // 获取父窗口的视频元素
                const newVideo = newWindow.document.getElementById('newVideo'); // 获取新窗口的视频元素
                this.newWindow = { videoElement: newVideo }; // 保存新窗口的视频元素引用

                // 每秒同步一次视频播放进度
                setInterval(() => {
                    if (!newVideo || !video) return;

                    const currentTime = video.currentTime; // 获取父窗口的视频播放时间
                    const isPlaying = !video.paused; // 获取父窗口视频是否在播放

                    // 向新窗口发送同步播放数据
                    newWindow.postMessage({
                        type: 'syncVideo',
                        currentTime: currentTime,
                        isPlaying: isPlaying
                    }, '*');
                }, 1000); // 每秒同步一次
            };
        },

        submitCaseForm() {
            this.$refs['elForm'].validate((valid) => {
                if (!valid) return; // 如果验证失败，直接返回

                const caseId = this.formData.casefield;
                getVideoCase(caseId).then(response => {
                    if (response.code === 200) {
                        const selectedCase = response.data;
                        this.caseVideoSrc = selectedCase.caseVideo; // 使用获取到的视频路径

                        // 播放原窗口视频
                        const video = this.$refs.caseVideo;
                        video.src = this.caseVideoSrc;
                        video.play();
                                        // 打开新窗口并播放视频
                                        this.openVideoInNewWindow(this.caseVideoSrc);
                    } else {
                        console.error('获取案例详情失败:', response.msg);
                    }
                }).catch(error => {
                    console.error('获取案例详情时发生错误:', error);
                });
            });
        },

        resetCaseForm() {
            this.$refs['elForm'].resetFields();
            this.caseVideoSrc = ''; // 清空视频源
        },

        submitModelForm() {
            this.$refs['elForm'].validate((valid) => {
                if (!valid) return; // 如果验证失败，直接返回
                // 查找选中的案例对象
                const selectedCase = this.caseOptions.find(item => item.value === this.formData.casefield);
                if (selectedCase) {
                    // 设置选中案例的视频源
                    this.caseVideoSrc = selectedCase.caseVideo;
                }
            });
        },

        resetModelForm() {
            this.$refs['elForm'].resetFields();
        },

        async fetchCaseOptions() {
            try {
                const response = await listCase(this.queryParams); // 调用接口获取数据
                if (response.code === 200) { // 判断接口是否成功返回数据
                    // 映射 rows 数据为下拉框选项
                    this.caseOptions = response.rows.map((item) => ({
                        label: item.caseName, // 显示在下拉框中的名称
                        value: item.caseId, // 绑定到 v-model 的值
                    }));
                } else {
                    console.error('接口返回异常:', response.msg);
                }
            } catch (error) {
                console.error('获取案例列表失败:', error);
            }
        },

        async fetchModelOptions() {
            try {
                const response = await listModel(this.queryParams); // 调用接口获取数据
                if (response.code === 200) { // 判断接口是否成功返回数据
                    // 映射 rows 数据为下拉框选项
                    this.modelOptions = response.rows.map((item) => ({
                        label: item.modelName, // 显示在下拉框中的名称
                        value: item.modelId, // 绑定到 v-model 的值
                    }));
                } else {
                    console.error('接口返回异常:', response.msg);
                }
            } catch (error) {
                console.error('获取算法列表失败:', error);
            }
        },

        updateCaseResult() {
            // 找到选中的案例
            const selectedCase = this.caseOptions.find(
                (item) => item.value === this.formData.casefield
            );
            if (selectedCase) {
                // 更新检测结果的案例字段
                this.formData.resultfield.case = selectedCase.label; // 显示名称
            } else {
                this.formData.resultfield.case = '';
            }
        },

        updateModelResult() {
            // 找到选中的算法
            const selectedModel = this.modelOptions.find(
                (item) => item.value === this.formData.modelfield
            );
            if (selectedModel) {
                // 更新检测结果的算法字段
                this.formData.resultfield.model = selectedModel.label; // 显示名称
            } else {
                this.formData.resultfield.model = '';
            }
        },
    }
};
</script>

<style scoped>
.app-container {
    display: flex;
    height: 100vh;
    /* 确保布局占满屏幕 */
}

/* 左侧视频区域 */
.left-container {
    flex: 2;
    display: flex;
    flex-direction: column;
    gap: 10px;
    padding: 10px;
    background-color: #f5f5f5;
    overflow-y: auto;
}

.video-box {
    flex: 1;
    /* 每个视频框平分空间 */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
    padding: 10px;
}

.video-box video {
    flex: 1;
    /* 视频高度自适应容器 */
    width: 100%;
    border-radius: 5px;
}

/* 样式调整：同时播放两个视频
.video-box div {
    display: flex;
    gap: 10px;
} */

/* 两个视频上下排列 */
.dual-video {
    display: flex;
    flex-direction: column;
    /* 垂直排列 */
    gap: 10px;
    /* 视频之间的间距 */
}

.dual-video>div {
    flex: 1;
    /* 平均分配空间 */
}

.dual-video video {
    width: 100%;
    height: auto;
    /* 保持视频比例 */
    border-radius: 5px;
}


/* 右侧功能区域 */
.right-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 10px;
    gap: 20px;
    background-color: #fff;
    border-left: 1px solid #ccc;
}

.section {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.section h3 {
    margin: 0;
    font-size: 16px;
    color: #333;
}

.results {
    flex: 1;
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    overflow-y: auto;
}

/* 标题居中样式 */
.el-descriptions__title {
    text-align: center;
}
</style>