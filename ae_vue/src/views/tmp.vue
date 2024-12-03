<template>
    <div>
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
        <el-form-item label="单选框组" prop="field102">
          <el-radio-group v-model="formData.field102" size="medium">
            <el-radio v-for="(item, index) in field102Options" :key="index" :label="item.value"
              :disabled="item.disabled">{{item.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
    </div>
  </template>
  <script>
  export default {
    components: {},
    props: [],
    data() {
      return {
        formData: {
          field102: 1,
        },
        rules: {
          field102: [{
            required: true,
            message: '单选框组不能为空',
            trigger: 'change'
          }],
        },
        field102Options: [{
          "label": "选项一",
          "value": 1
        }, {
          "label": "选项二",
          "value": 2
        }],
      }
    },
    computed: {},
    watch: {},
    created() {},
    mounted() {},
    methods: {
      submitForm() {
        this.$refs['elForm'].validate(valid => {
          if (!valid) return
          // TODO 提交表单
        })
      },
      resetForm() {
        this.$refs['elForm'].resetFields()
      },
    }
  }
  
  </script>
  <style>
  </style>
  