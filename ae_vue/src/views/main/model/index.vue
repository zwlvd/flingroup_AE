<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
        <el-form-item label="算法模型名称" prop="modelName">
          <el-input
            v-model="queryParams.modelName"
            placeholder="请输入算法模型名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="算法类型" prop="modelType">
          <el-select v-model="queryParams.modelType" placeholder="请选择算法类型" clearable>
            <el-option
              v-for="dict in dict.type.main_model_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
  
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['main:model:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['main:model:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['main:model:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['main:model:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <el-table v-loading="loading" :data="modelList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="算法模型名称" align="center" prop="modelName" />
        <el-table-column label="算法类型" align="center" prop="modelType">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.main_model_type" :value="scope.row.modelType"/>
          </template>
        </el-table-column>
        <el-table-column label="模型地址" align="center" prop="modelAddress" />
        <el-table-column label="训练数据集" align="center" prop="datasetName" />
        <el-table-column label="模型情况" align="center" prop="modelInfo" />
        <el-table-column label="备注" align="center" prop="remark" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['main:model:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['main:model:remove']"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
  
      <!-- 添加或修改算法模型对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="110px">
          <el-form-item label="算法模型名称" prop="modelName">
            <el-input v-model="form.modelName" placeholder="请输入算法模型名称" />
          </el-form-item>
          <el-form-item label="算法类型" prop="modelType">
            <el-select v-model="form.modelType" placeholder="请选择算法类型">
              <el-option
                v-for="dict in dict.type.main_model_type"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="模型地址" prop="modelAddress">
            <el-input v-model="form.modelAddress" placeholder="请输入模型地址" />
          </el-form-item>
          <el-form-item label="训练数据集" prop="datasetName">
            <el-input v-model="form.datasetName" placeholder="请输入训练数据集" />
          </el-form-item>
          <el-form-item label="模型情况" prop="modelInfo">
            <el-input v-model="form.modelInfo" type="textarea" placeholder="请输入内容" />
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
    </div>
  </template>
  
  <script>
  import { listModel, getModel, delModel, addModel, updateModel } from "@/api/main/model";
  
  export default {
    name: "Model",
    dicts: ['main_model_type'],
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
        // 算法模型表格数据
        modelList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          modelName: null,
          modelType: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          modelName: [
            { required: true, message: "算法模型名称不能为空", trigger: "blur" }
          ],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询算法模型列表 */
      getList() {
        this.loading = true;
        listModel(this.queryParams).then(response => {
          this.modelList = response.rows;
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
          modelId: null,
          modelName: null,
          modelType: null,
          modelAddress: null,
          datasetName: null,
          modelInfo: null,
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
        this.ids = selection.map(item => item.modelId)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加算法模型";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const modelId = row.modelId || this.ids
        getModel(modelId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改算法模型";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.modelId != null) {
              updateModel(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addModel(this.form).then(response => {
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
        const modelIds = row.modelId || this.ids;
        this.$modal.confirm('是否确认删除算法模型编号为"' + modelIds + '"的数据项？').then(function() {
          return delModel(modelIds);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('main/model/export', {
          ...this.queryParams
        }, `model_${new Date().getTime()}.xlsx`)
      }
    }
  };
  </script>
  