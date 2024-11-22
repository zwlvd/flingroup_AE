package com.ruoyi.main.service;

import java.util.List;
import com.ruoyi.main.domain.MainCase;

/**
 * 案例库Service接口
 * 
 * @author akuza
 * @date 2024-11-19
 */
public interface IMainCaseService 
{
    /**
     * 查询案例库
     * 
     * @param caseId 案例库主键
     * @return 案例库
     */
    public MainCase selectMainCaseByCaseId(Long caseId);

    /**
     * 查询案例库视频
     *
     * @param caseId 案例库主键
     * @return 案例库
     */
    public MainCase selectMainCaseVideoByCaseId(Long caseId);

    /**
     * 查询案例库列表
     * 
     * @param mainCase 案例库
     * @return 案例库集合
     */
    public List<MainCase> selectMainCaseList(MainCase mainCase);

    /**
     * 新增案例库
     * 
     * @param mainCase 案例库
     * @return 结果
     */
    public int insertMainCase(MainCase mainCase);

    /**
     * 修改案例库
     * 
     * @param mainCase 案例库
     * @return 结果
     */
    public int updateMainCase(MainCase mainCase);

    /**
     * 批量删除案例库
     * 
     * @param caseIds 需要删除的案例库主键集合
     * @return 结果
     */
    public int deleteMainCaseByCaseIds(Long[] caseIds);

    /**
     * 删除案例库信息
     * 
     * @param caseId 案例库主键
     * @return 结果
     */
    public int deleteMainCaseByCaseId(Long caseId);
}
