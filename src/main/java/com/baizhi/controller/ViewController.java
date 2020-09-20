package com.baizhi.controller;

import com.baizhi.entity.Province;
import com.baizhi.entity.View;
import com.baizhi.service.ProvinceService;
import com.baizhi.service.ViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName ViewController
 * @Author wyy
 * @Date 2020/7/29 19:43
 * @Description TOOO
 */
@Controller
@Scope("prototype")
@RequestMapping("/view")
public class ViewController {
    @Autowired
    private ViewService viewService;
    @Autowired
    private ProvinceService provinceService;
    @RequestMapping("/queryPage")
    public String queryPage(String pid, Integer currentPage, Integer pageSize, Model model, HttpSession session){
        if(currentPage==null){
            currentPage=1;
        }
        if (pageSize==null){
            pageSize=2;
        }
        List<View> list = viewService.queryPage(pid, currentPage, pageSize);
        //获取总条数
        Integer count = viewService.count(pid);
        //计算总页数
        Integer totalPage=count%pageSize==0?count/pageSize:count/pageSize+1;
        model.addAttribute("list",list);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("currentPage",currentPage);
        session.setAttribute("pid",pid);
        return "forward:/viewspot/showViewspot.jsp";
    }
    @RequestMapping("/add")
    public String add(MultipartFile file, View view, HttpServletRequest request) throws IOException {
        System.out.println("添加的view"+view);
        //图片的上传   获取绝对路径
        System.out.println("file==="+file);
        //获取文件上传的真实目录
        String realPath = request.getRealPath("/img");
        System.out.println("realpath=" + realPath);
        String filename = file.getOriginalFilename();
        System.out.println("filename==" + filename);
        //文件上传到某个位置
        file.transferTo(new File(realPath, filename));
        view.setPicture(filename);
        viewService.add(view);



        //添加景点时选择的pid
        String pid = view.getProvince().getPid();
        Province province = provinceService.queryOne(pid);
        System.out.println("province=="+province);
        //获取原本数量
        Integer count = province.getCount();
        System.out.println("count=="+count);
        //给数量+1
        province.setCount(count+1);
        //修改省份的景点数量
        provinceService.update(province);
        return "redirect:queryPage?pid="+pid;
    }

    @RequestMapping("/delete")
    public String delete(String vid,String pid) {
        System.out.println("这是删除景点的controller");
        Province province = provinceService.queryOne(pid);
        System.out.println("province-===="+province);
        Integer count = province.getCount();
        //给省份对应的景点数量-1
        province.setCount(count-1);
        provinceService.update(province);
        viewService.delete(vid);
        return "redirect:queryPage?pid="+pid;
    }
    @RequestMapping("/queryOne")
    public String queryOne(String vid, Model model) {
        System.out.println("vid==="+vid);
        View view = viewService.queryOne(vid);
        model.addAttribute("view",view);
        //查询所有省份
        List<Province> list = provinceService.queryAll();
        model.addAttribute("list",list);
        return "forward:/viewspot/updateViewspot.jsp";
    }

    @RequestMapping("/update")
    public String update(MultipartFile file, View view, HttpServletRequest request) throws IOException {
        System.out.println("file====="+file);
        System.out.println(file.getOriginalFilename()+"1111111111");
        System.out.println("view========"+view);
        String pid = view.getProvince().getPid();
        //判断文件是否为空
        if(!file.getOriginalFilename().equals("")){
            //景点信息进行了修改
            //获取文件上传的真实目录
            String realPath = request.getRealPath("/img");
            String filename = file.getOriginalFilename();
            file.transferTo(new File(realPath,filename));
            view.setPicture(filename);
        }
        //景点信息没有进行修改
        viewService.update(view);
        return "redirect:queryPage?pid="+pid;



    }

}
