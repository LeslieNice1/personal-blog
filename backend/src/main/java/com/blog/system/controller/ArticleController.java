package com.blog.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.blog.system.common.Result;
import com.blog.system.entity.Article;
import com.blog.system.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/article")
@CrossOrigin
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/list")
    public Result<List<Article>> list() {
        List<Article> list = articleService.lambdaQuery()
                .eq(Article::getStatus, 1)
                .orderByDesc(Article::getCreateTime)
                .list();
        return Result.success(list);
    }

    @GetMapping("/{id}")
    public Result<Article> getById(@PathVariable Long id) {
        Article article = articleService.getById(id);
        if (article != null) {
            article.setViews(article.getViews() + 1);
            articleService.updateById(article);
        }
        return Result.success(article);
    }

    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody Article article) {
        return Result.success(articleService.save(article));
    }
}
