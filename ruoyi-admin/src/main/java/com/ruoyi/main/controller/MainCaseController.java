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
import com.ruoyi.main.domain.MainCase;
import com.ruoyi.main.service.IMainCaseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 案例库Controller
 * 
 * @author akuza
 * @date 2024-11-19
 */
@RestController
@RequestMapping("/main/case")
public class MainCaseController extends BaseController
{
    @Autowired
    private IMainCaseService mainCaseService;

    /**
     * 查询案例库列表
     */
    @PreAuthorize("@ss.hasPermi('main:case:list')")
    @GetMapping("/list")
    public TableDataInfo list(MainCase mainCase)
    {
        startPage();
        List<MainCase> list = mainCaseService.selectMainCaseList(mainCase);
        return getDataTable(list);
    }

    /**
     * 导出案例库列表
     */
    @PreAuthorize("@ss.hasPermi('main:case:export')")
    @Log(title = "案例库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MainCase mainCase)
    {
        List<MainCase> list = mainCaseService.selectMainCaseList(mainCase);
        ExcelUtil<MainCase> util = new ExcelUtil<MainCase>(MainCase.class);
        util.exportExcel(response, list, "案例库数据");
    }

    /**
     * 获取案例库详细信息
     */
    @PreAuthorize("@ss.hasPermi('main:case:query')")
    @GetMapping(value = "/{caseId}")
    public AjaxResult getInfo(@PathVariable("caseId") Long caseId)
    {
        return success(mainCaseService.selectMainCaseByCaseId(caseId));
    }

    /**
     * 新增案例库
     */
    @PreAuthorize("@ss.hasPermi('main:case:add')")
    @Log(title = "案例库", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MainCase mainCase)
    {
        return toAjax(mainCaseService.insertMainCase(mainCase));
    }

    /**
     * 修改案例库
     */
    @PreAuthorize("@ss.hasPermi('main:case:edit')")
    @Log(title = "案例库", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MainCase mainCase)
    {
        return toAjax(mainCaseService.updateMainCase(mainCase));
    }

    /**
     * 删除案例库
     */
    @PreAuthorize("@ss.hasPermi('main:case:remove')")
    @Log(title = "案例库", businessType = BusinessType.DELETE)
	@DeleteMapping("/{caseIds}")
    public AjaxResult remove(@PathVariable Long[] caseIds)
    {
        return toAjax(mainCaseService.deleteMainCaseByCaseIds(caseIds));
    }
}
