package com.dahaedream.common.controller;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.common.Common;
import com.dahaedream.common.service.CommonService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CommonController {

    private final CommonService commonService;

    @PostMapping("/common/category.dox")
    @ResponseBody
    public String getCategory(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = commonService.selectCategory(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/getMember.dox")
    @ResponseBody
    public String getMember(@AuthenticationPrincipal CustomUserDetails user) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("nickname", user.getNickname());
        resultMap.put("memberId", user.getMemberId());
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/common/upload.dox")
    @ResponseBody
    public String upload(@RequestParam("files") List<MultipartFile> files,
      @RequestParam("requestId") int requestId) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<>();
        try {
            for (int i = 0; i < files.size(); i++) {
                MultipartFile multi = files.get(i);
                String path = System.getProperty("user.dir");
                String originFilename = multi.getOriginalFilename();
                String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                String saveFileName = Common.genSaveFileName(extName);
                if(!multi.isEmpty()) {
                    File file = new File(path + "\\src\\main\\webapp\\uploads", saveFileName);
                    multi.transferTo(file);

                    HashMap<String, Object> map = new HashMap<>();
                    map.put("fileName", saveFileName);
                    map.put("filePath", "../uploads/" + saveFileName);
                    map.put("requestId", requestId);
                    map.put("thumbnail", i == 0);

                    commonService.insertImg(map);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/common/selectImg.dox")
    @ResponseBody
    public String selectImg(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = commonService.selectImg(map);
        return new Gson().toJson(resultMap);
    }
}

