package com.kpsl.auction.ad.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdImageController {

/*	Logger log = Logger.getLogger(this.getClass());
	@RequestMapping(value = "/adImage", method = RequestMethod.POST)
	public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {
        try {
        	log.debug(file);
            //UploadFile uploadedFile = imageService.store(file);
            //return ResponseEntity.ok().body("/image/" + uploadedFile.getId());
        	return null;
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }*/
}
