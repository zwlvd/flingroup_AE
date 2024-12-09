package com.ruoyi.main.controller;

import com.ruoyi.common.core.controller.BaseController;

import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacv.*;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.common.annotation.Anonymous;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@RestController
@RequestMapping("/main/camera")
@Anonymous
public class MainCameraController extends BaseController {

    @GetMapping(value = "/stream", produces = "multipart/x-mixed-replace; boundary=frame")
    public void getCameraStream(HttpServletResponse response) throws IOException {
        // 设置HTTP响应头，告诉浏览器这是一个MJPEG流
        response.setContentType("multipart/x-mixed-replace; boundary=frame");
        OutputStream outStream = response.getOutputStream();

        // 创建 VideoCapture 对象来打开摄像头
        FrameGrabber grabber = new OpenCVFrameGrabber(1);  // 0 默认是第一个摄像头
        try {
            grabber.start();  // 启动摄像头

            while (true) {
                // 获取一帧图像
                Frame frame = grabber.grab();

                // 将 Frame 转换为 BufferedImage
                BufferedImage image = frameToBufferedImage(frame);

                // 将 BufferedImage 转换为字节数组
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(image, "JPEG", baos);
                byte[] imageBytes = baos.toByteArray();

                // 构建MJPEG格式响应头
                outStream.write(("--frame\r\n").getBytes());
                outStream.write(("Content-Type: image/jpeg\r\n").getBytes());
                outStream.write(("Content-Length: " + imageBytes.length + "\r\n\r\n").getBytes());
                outStream.write(imageBytes);
                outStream.write("\r\n".getBytes());
                outStream.flush();

                // 可根据需求调整帧率
                Thread.sleep(30);  // 每帧大约33ms，相当于30帧/秒

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                grabber.stop();  // 释放摄像头资源
            } catch (FrameGrabber.Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 使用 Java2DFrameConverter 将 Frame 转换为 BufferedImage
    private BufferedImage frameToBufferedImage(Frame frame) {
        Java2DFrameConverter converter = new Java2DFrameConverter();
        return converter.convert(frame);
    }
}
