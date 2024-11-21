package com.ruoyi.main.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.main.domain.MainModel;
import com.ruoyi.main.service.IMainModelService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 算法模型Controller
 * 
 * @author akuza
 * @date 2024-11-21
 */
@RestController
@RequestMapping("/main/model")
public class MainModelController extends BaseController
{
    @Autowired
    private IMainModelService mainModelService;

    /**
     * 查询算法模型列表
     */
    @PreAuthorize("@ss.hasPermi('main:model:list')")
    @GetMapping("/list")
    public TableDataInfo list(MainModel mainModel)
    {
        startPage();
        List<MainModel> list = mainModelService.selectMainModelList(mainModel);
        return getDataTable(list);
    }

    /**
     * 导出算法模型列表
     */
    @PreAuthorize("@ss.hasPermi('main:model:export')")
    @Log(title = "算法模型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MainModel mainModel)
    {
        List<MainModel> list = mainModelService.selectMainModelList(mainModel);
        ExcelUtil<MainModel> util = new ExcelUtil<MainModel>(MainModel.class);
        util.exportExcel(response, list, "算法模型数据");
    }

    /**
     * 获取算法模型详细信息
     */
    @PreAuthorize("@ss.hasPermi('main:model:query')")
    @GetMapping(value = "/{modelId}")
    public AjaxResult getInfo(@PathVariable("modelId") Long modelId)
    {
        return success(mainModelService.selectMainModelByModelId(modelId));
    }

    /**
     * 新增算法模型
     */
    @PreAuthorize("@ss.hasPermi('main:model:add')")
    @Log(title = "算法模型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MainModel mainModel)
    {
        return toAjax(mainModelService.insertMainModel(mainModel));
    }

    /**
     * 修改算法模型
     */
    @PreAuthorize("@ss.hasPermi('main:model:edit')")
    @Log(title = "算法模型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MainModel mainModel)
    {
        return toAjax(mainModelService.updateMainModel(mainModel));
    }

    /**
     * 删除算法模型
     */
    @PreAuthorize("@ss.hasPermi('main:model:remove')")
    @Log(title = "算法模型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{modelIds}")
    public AjaxResult remove(@PathVariable Long[] modelIds)
    {
        return toAjax(mainModelService.deleteMainModelByModelIds(modelIds));
    }
}
