package com.ruoyi.main.mapper;

import java.util.List;
import com.ruoyi.main.domain.MainModel;

/**
 * 算法模型Mapper接口
 * 
 * @author akuza
 * @date 2024-11-21
 */
public interface MainModelMapper 
{
    /**
     * 查询算法模型
     * 
     * @param modelId 算法模型主键
     * @return 算法模型
     */
    public MainModel selectMainModelByModelId(Long modelId);

    /**
     * 查询算法模型列表
     * 
     * @param mainModel 算法模型
     * @return 算法模型集合
     */
    public List<MainModel> selectMainModelList(MainModel mainModel);

    /**
     * 新增算法模型
     * 
     * @param mainModel 算法模型
     * @return 结果
     */
    public int insertMainModel(MainModel mainModel);

    /**
     * 修改算法模型
     * 
     * @param mainModel 算法模型
     * @return 结果
     */
    public int updateMainModel(MainModel mainModel);

    /**
     * 删除算法模型
     * 
     * @param modelId 算法模型主键
     * @return 结果
     */
    public int deleteMainModelByModelId(Long modelId);

    /**
     * 批量删除算法模型
     * 
     * @param modelIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMainModelByModelIds(Long[] modelIds);
}
