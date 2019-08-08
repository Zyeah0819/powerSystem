package com.hyeah.powerSystem.controller;


import com.hyeah.powerSystem.daomain.Product;
import com.hyeah.powerSystem.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;



    @RequestMapping("addProduct.do")
    public String addProduct(Product product) throws Exception{
        productService.addProduct(product);
        return "redirect:findAll.do";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("toAddProduct.do")
    public String toAddProduct(){
        return "product-add";
    }

    /**
     * 查询所有的产品数据
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll();
        mv.addObject("productList",productList);
        mv.setViewName("product-list");
        return mv;
    }
}
