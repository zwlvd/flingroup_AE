package com.ruoyi.main.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.ruoyi.main.mapper.MainCaseMapper;
import com.ruoyi.main.domain.MainCase;
import com.ruoyi.main.service.IMainCaseService;

/**
 * 案例库Service业务层处理
 * 
 * @author akuza
 * @date 2024-11-19
 */
@Service
public class MainCaseServiceImpl implements IMainCaseService 
{
    @Autowired
    private MainCaseMapper mainCaseMapper;

    @Value("${server.port}")
    private String port;

    /**
     * 查询案例库
     * 
     * @param caseId 案例库主键
     * @return 案例库
     */
    @Override
    public MainCase selectMainCaseByCaseId(Long caseId)
    {
        return mainCaseMapper.selectMainCaseByCaseId(caseId);
    }

    /**
     * 查询案例库视频
     *
     * @param caseId 案例库主键
     * @return 案例库
     */
    @Override
    public MainCase selectMainCaseVideoByCaseId(Long caseId)
    {
        MainCase query= mainCaseMapper.selectMainCaseByCaseId(caseId);
        String profilePath = "http://localhost:" + port ;
        query.setCaseVideo(profilePath + query.getCaseVideo());
        return query;
    }

    /**
     * 查询案例库列表
     * 
     * @param mainCase 案例库
     * @return 案例库
     */
    @Override
    public List<MainCase> selectMainCaseList(MainCase mainCase)
    {
        List<MainCase> query= mainCaseMapper.selectMainCaseList(mainCase);
        String profilePath = "http://localhost:" + port ;

        query.forEach(mainCaseItem -> {
            if (mainCaseItem.getCaseVideo() != null) {
                // 替换 `profile` 为实际路径
                mainCaseItem.setCaseVideo(profilePath + mainCaseItem.getCaseVideo());
            }
        });
        return query;
    }

    /**
     * 新增案例库
     * 
     * @param mainCase 案例库
     * @return 结果
     */
    @Override
    public int insertMainCase(MainCase mainCase)
    {
        mainCase.setCreateTime(DateUtils.getNowDate());
        return mainCaseMapper.insertMainCase(mainCase);
    }

    /**
     * 修改案例库
     * 
     * @param mainCase 案例库
     * @return 结果
     */
    @Override
    public int updateMainCase(MainCase mainCase)
    {
        mainCase.setUpdateTime(DateUtils.getNowDate());
        return mainCaseMapper.updateMainCase(mainCase);
    }

    /**
     * 批量删除案例库
     * 
     * @param caseIds 需要删除的案例库主键
     * @return 结果
     */
    @Override
    public int deleteMainCaseByCaseIds(Long[] caseIds)
    {
        return mainCaseMapper.deleteMainCaseByCaseIds(caseIds);
    }

    /**
     * 删除案例库信息
     * 
     * @param caseId 案例库主键
     * @return 结果
     */
    @Override
    public int deleteMainCaseByCaseId(Long caseId)
    {
        return mainCaseMapper.deleteMainCaseByCaseId(caseId);
    }
}
