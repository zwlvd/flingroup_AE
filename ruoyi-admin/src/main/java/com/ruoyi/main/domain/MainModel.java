package com.ruoyi.main.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 算法模型对象 main_model
 * 
 * @author akuza
 * @date 2024-11-21
 */
public class MainModel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 算法模型ID */
    private Long modelId;

    /** 算法模型名称 */
    @Excel(name = "算法模型名称")
    private String modelName;

    /** 算法类型 */
    @Excel(name = "算法类型")
    private String modelType;

    /** 模型地址 */
    @Excel(name = "模型地址")
    private String modelAddress;

    /** 训练数据集 */
    @Excel(name = "训练数据集")
    private String datasetName;

    /** 模型情况 */
    @Excel(name = "模型情况")
    private String modelInfo;

    public void setModelId(Long modelId) 
    {
        this.modelId = modelId;
    }

    public Long getModelId() 
    {
        return modelId;
    }
    public void setModelName(String modelName) 
    {
        this.modelName = modelName;
    }

    public String getModelName() 
    {
        return modelName;
    }
    public void setModelType(String modelType) 
    {
        this.modelType = modelType;
    }

    public String getModelType() 
    {
        return modelType;
    }
    public void setModelAddress(String modelAddress) 
    {
        this.modelAddress = modelAddress;
    }

    public String getModelAddress() 
    {
        return modelAddress;
    }
    public void setDatasetName(String datasetName) 
    {
        this.datasetName = datasetName;
    }

    public String getDatasetName() 
    {
        return datasetName;
    }
    public void setModelInfo(String modelInfo) 
    {
        this.modelInfo = modelInfo;
    }

    public String getModelInfo() 
    {
        return modelInfo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("modelId", getModelId())
            .append("modelName", getModelName())
            .append("modelType", getModelType())
            .append("modelAddress", getModelAddress())
            .append("datasetName", getDatasetName())
            .append("modelInfo", getModelInfo())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
