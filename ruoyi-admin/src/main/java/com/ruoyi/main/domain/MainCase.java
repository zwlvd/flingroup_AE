package com.ruoyi.main.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 案例库对象 main_case
 *
 * @author akuza
 * @date 2024-11-19
 */
public class MainCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 案例ID */
    private Long caseId;

    /** 案例名称 */
    @Excel(name = "案例名称")
    private String caseName;

    /** 案例类型 */
    @Excel(name = "案例类型")
    private String caseType;

    /** 案例地址 */
    @Excel(name = "案例地址")
    private String caseAddress;

    /** 案例介绍 */
    @Excel(name = "案例介绍")
    private String caseInfo;

    /** 案例图片 */
    @Excel(name = "案例图片")
    private String caseImage;

    /** 案例视频 */
    @Excel(name = "案例视频")
    private String caseVideo;

    public void setCaseId(Long caseId)
    {
        this.caseId = caseId;
    }

    public Long getCaseId()
    {
        return caseId;
    }
    public void setCaseName(String caseName)
    {
        this.caseName = caseName;
    }

    public String getCaseName()
    {
        return caseName;
    }
    public void setCaseType(String caseType)
    {
        this.caseType = caseType;
    }

    public String getCaseType()
    {
        return caseType;
    }
    public void setCaseAddress(String caseAddress)
    {
        this.caseAddress = caseAddress;
    }

    public String getCaseAddress()
    {
        return caseAddress;
    }
    public void setCaseInfo(String caseInfo)
    {
        this.caseInfo = caseInfo;
    }

    public String getCaseInfo()
    {
        return caseInfo;
    }
    public void setCaseImage(String caseImage)
    {
        this.caseImage = caseImage;
    }

    public String getCaseImage()
    {
        return caseImage;
    }
    public void setCaseVideo(String caseVideo)
    {
        this.caseVideo = caseVideo;
    }

    public String getCaseVideo()
    {
        return caseVideo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("caseId", getCaseId())
                .append("caseName", getCaseName())
                .append("caseType", getCaseType())
                .append("caseAddress", getCaseAddress())
                .append("caseInfo", getCaseInfo())
                .append("caseImage", getCaseImage())
                .append("caseVideo", getCaseVideo())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
