<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="案例名称" prop="caseName">
        <el-input v-model="queryParams.caseName" placeholder="请输入案例名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="案例类型" prop="caseType">
        <el-input v-model="queryParams.aseTypes" placeholder="请输入案例类型" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="案例介绍" prop="caseInfo">
        <el-input v-model="queryParams.caseInfo" placeholder="请输入案例介绍" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['main:case:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['main:case:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['main:case:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['main:case:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="caseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="案例名称" align="center" prop="caseName" />
      <el-table-column label="案例类型" align="center" prop="caseType" />
      <el-table-column label="案例地址" align="center" prop="caseAddress" />
      <el-table-column label="案例介绍" align="center" prop="caseInfo" />
      <el-table-column label="案例图片" align="center" prop="caseImage">
        <template slot-scope="scope">
          <image-preview :src="scope.row.caseImage" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="案例视频" align="center" prop="caseVideo">
        <template slot-scope="scope">
          <!-- 检查是否有视频URL -->
          <div v-if="scope.row.caseVideo">
            <!-- 使用 <video> 标签预览视频 -->
            <video :src="scope.row.caseVideo" controls preload="metadata" width="100" height="60"
              style="cursor: pointer; border: 1px solid #ccc; border-radius: 4px;"
              @click.stop="openVideoDialog(scope.row.caseVideo)">
            </video>
            <!-- 打印视频 URL -->
          </div>
          <!-- 如果没有视频，显示提示 -->
          <span v-else>无视频</span>
        </template>
      </el-table-column>

      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['main:case:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['main:case:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改案例库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="案例名称" prop="caseName">
          <el-input v-model="form.caseName" placeholder="请输入案例名称" />
        </el-form-item>
        <el-form-item label="案例地址" prop="caseAddress">
          <el-input v-model="form.caseAddress" placeholder="请输入案例地址" />
        </el-form-item>
        <el-form-item label="案例类型" prop="caseAddress">
          <el-input v-model="form.caseAddress" placeholder="请输入案例类型" />
        </el-form-item>
        <el-form-item label="案例介绍" prop="caseInfo">
          <el-input v-model="form.caseInfo" placeholder="请输入案例介绍" />
        </el-form-item>
        <el-form-item label="案例图片" prop="caseImage">
          <image-upload v-model="form.caseImage" />
        </el-form-item>

        <el-form-item label="案例视频" prop="caseVideo">
          <file-upload v-model="form.caseVideo" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog title="视频预览" :visible.sync="videoDialogVisible" width="800px" append-to-body @close="closeVideoDialog">
      <video v-if="currentVideoUrl" :src="currentVideoUrl" controls autoplay
        style="width: 100%; height: auto; border-radius: 4px;">
      </video>
    </el-dialog>


  </div>
</template>

<script>
import { listCase, getCase, delCase, addCase, updateCase } from "@/api/main/case";

export default {
  name: "Case",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 案例库表格数据
      caseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        caseName: null,
        caseType: null,
        caseAddress: null,
        caseInfo: null,
        caseImage: null,
        caseVideo: null,
      },
      videoDialogVisible: false, // 控制视频预览对话框的显示
      currentVideoUrl: "http://localhost:18080/profile/upload/2024/11/21/视频1_20241121194648A002.mov", // 当前视频的 URL
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        caseName: [
          { required: true, message: "案例名称不能为空", trigger: "blur" }
        ],
        caseType: [
          { required: true, message: "案例类型不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询案例库列表 */
    getList() {
      this.loading = true;
      listCase(this.queryParams).then(response => {
        this.caseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        caseId: null,
        caseName: null,
        caseType: null,
        caseAddress: null,
        caseInfo: null,
        caseImage: null,
        caseVideo: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.caseId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加案例库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const caseId = row.caseId || this.ids
      getCase(caseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改案例库";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.caseId != null) {
            updateCase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCase(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const caseIds = row.caseId || this.ids;
      this.$modal.confirm('是否确认删除案例库编号为"' + caseIds + '"的数据项？').then(function () {
        return delCase(caseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('main/case/export', {
        ...this.queryParams
      }, `case_${new Date().getTime()}.xlsx`)
    },
    // 打开视频预览对话框
    openVideoDialog(videoUrl) {
      console.log("视频点击事件触发，视频 URL:", videoUrl);
      if (!videoUrl) {
        this.$message.error("视频地址无效");
        return;
      }
      this.currentVideoUrl = videoUrl; // 设置当前视频 URL
      this.videoDialogVisible = true; // 打开对话框
    },
    // 关闭对话框
    closeVideoDialog() {
      this.videoDialogVisible = false; // 关闭对话框
      this.currentVideoUrl = ""; // 清空视频 URL
    },
  }
};
</script>