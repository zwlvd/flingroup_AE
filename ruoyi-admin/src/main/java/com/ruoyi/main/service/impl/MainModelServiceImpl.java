package com.ruoyi.main.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.main.mapper.MainModelMapper;
import com.ruoyi.main.domain.MainModel;
import com.ruoyi.main.service.IMainModelService;

/**
 * 算法模型Service业务层处理
 * 
 * @author akuza
 * @date 2024-11-21
 */
@Service
public class MainModelServiceImpl implements IMainModelService 
{
    @Autowired
    private MainModelMapper mainModelMapper;

    /**
     * 查询算法模型
     * 
     * @param modelId 算法模型主键
     * @return 算法模型
     */
    @Override
    public MainModel selectMainModelByModelId(Long modelId)
    {
        return mainModelMapper.selectMainModelByModelId(modelId);
    }

    /**
     * 查询算法模型列表
     * 
     * @param mainModel 算法模型
     * @return 算法模型
     */
    @Override
    public List<MainModel> selectMainModelList(MainModel mainModel)
    {
        return mainModelMapper.selectMainModelList(mainModel);
    }

    /**
     * 新增算法模型
     * 
     * @param mainModel 算法模型
     * @return 结果
     */
    @Override
    public int insertMainModel(MainModel mainModel)
    {
        mainModel.setCreateTime(DateUtils.getNowDate());
        return mainModelMapper.insertMainModel(mainModel);
    }

    /**
     * 修改算法模型
     * 
     * @param mainModel 算法模型
     * @return 结果
     */
    @Override
    public int updateMainModel(MainModel mainModel)
    {
        mainModel.setUpdateTime(DateUtils.getNowDate());
        return mainModelMapper.updateMainModel(mainModel);
    }

    /**
     * 批量删除算法模型
     * 
     * @param modelIds 需要删除的算法模型主键
     * @return 结果
     */
    @Override
    public int deleteMainModelByModelIds(Long[] modelIds)
    {
        return mainModelMapper.deleteMainModelByModelIds(modelIds);
    }

    /**
     * 删除算法模型信息
     * 
     * @param modelId 算法模型主键
     * @return 结果
     */
    @Override
    public int deleteMainModelByModelId(Long modelId)
    {
        return mainModelMapper.deleteMainModelByModelId(modelId);
    }
}
