package com.baizhi.controller;

import com.baizhi.entity.Province;
import com.baizhi.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @ClassName ProvinceController
 * @Author wyy
 * @Date 2020/7/29 19:43
 * @Description TOOO
 */
@Controller
@RequestMapping("/province")
@Scope("prototype")
public class ProvinceController {
    @Autowired
    private ProvinceService provinceService;
    @RequestMapping("/queryPage")
    public String queryPage(Model model, Integer currentPage, Integer pageSize ){
        if(currentPage==null){
            currentPage=1;
        }
        if (pageSize==null){
            pageSize=4;
        }
        List<Province> list = provinceService.queryPage(currentPage,pageSize);
        model.addAttribute("list",list);
        //获取总条数
        Integer count = provinceService.count();
        //计算总页数
        Integer totalPage=count%pageSize==0? count/pageSize:count/pageSize+1;
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("currentPage",currentPage);
        return "forward:/province/showProvince.jsp";
    }
    @RequestMapping("/add")
    public String add(Province province){
        province.setCount(0);
        provinceService.add(province);
        return "redirect:queryPage";
    }

    @RequestMapping("/delete")
    public String delete(String pid){
        //删除省份  判断下面有没有景点
        Province province = provinceService.queryOne(pid);
        System.out.println("删除的count"+province.getCount());
        if (province.getCount()==0){
            provinceService.delete(pid);
            return "redirect:queryPage";
        }else{
            return "redirect:queryPage";
        }
    }

    @RequestMapping("/queryOne")
    public String queryOne(String pid, Model model){
        Province province = provinceService.queryOne(pid);
        model.addAttribute("province",province);
        return "forward:/province/updateProvince.jsp";
    }

    @RequestMapping("/update")
    public String update(Province province){
        System.out.println("this is update ====province==="+province);
        provinceService.update(province);
        return "redirect:queryPage";
    }
    //查询所有的省份
    @RequestMapping("/queryAll")
    public String queryAll(Model model){
        System.out.println("查询所有省份的controller=======");
        List<Province> list = provinceService.queryAll();
        model.addAttribute("list",list);
        return "forward:/viewspot/addViewspot.jsp";
    }

}
