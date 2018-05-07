package com.project.controller;

import com.project.model.MaterialEntity;
import com.project.service.ProfessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;


import java.io.*;

@Controller
public class ProfessorController  {

    @Autowired
    private ProfessorService professorService;

    @RequestMapping(value="/uploadController", method = RequestMethod.POST)
    public ModelAndView upLoadMaterial(HttpServletRequest request) {

        String examName = request.getParameter("nameE");
        String idExam = request.getParameter("idE");
        String exam = request.getParameter("exam");

        ModelAndView model = new ModelAndView();

        model.addObject(request.getSession().getAttribute("professor"));
        model.addObject("nameE", examName);
        model.addObject("idE",idExam);
        model.setViewName("upLoadMaterial");

        return model;
    }

    @RequestMapping(value="/insertMaterialController", method = RequestMethod.POST)
    public ModelAndView insertMaterial(HttpServletRequest request, @RequestParam("nomeVideo") String videoName,
                                       @RequestParam("myInputsV") String videoLink,
                                       @RequestParam("nomeSlide") String noteName,
                                       @RequestParam("myInputsS") File file) throws IOException, ServletException {
        ModelAndView model = new ModelAndView();


        //byte[] bytes = readBytesFromFile();

        byte[] bytes = new byte[1000];
        MaterialEntity m = new MaterialEntity(noteName, bytes, videoLink, videoName);

        boolean t = professorService.insertMeaterial(m);

        if(t){
        model.addObject(request.getSession().getAttribute("professor"));

        model.setViewName("professorWelcome");
        }
        else{
            model.setViewName("upLoadMaterial");
        }
        return model;
    }

    private static byte[] readBytesFromFile(String filePath) throws IOException {
        File inputFile = new File(filePath);
        FileInputStream inputStream = new FileInputStream(inputFile);

        byte[] fileBytes = new byte[(int) inputFile.length()];
        inputStream.read(fileBytes);
        inputStream.close();

        return fileBytes;
    }

}
