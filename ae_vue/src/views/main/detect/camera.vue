<template>
    <div class="camera-stream">
      <h2>实时摄像头画面</h2>
      <!-- 直接使用 MJPEG 流的 URL -->
      <img :src="cameraStreamUrl" alt="Camera Stream" />
      <p v-if="!cameraStreamUrl">正在加载摄像头画面...</p>
    </div>
  </template>
  
  <script>
  export default {
    name: 'CameraStream',
    data() {
      return {
        // 保存视频流的URL
        cameraStreamUrl: 'http://localhost:18080/main/camera/stream',  // 后端的 MJPEG 流地址
      };
    },
    mounted() {
      // 你可以在这里添加对摄像头流的初始化操作
      console.log('摄像头流已加载');
    },
    beforeDestroy() {
      // 需要做清理工作时，可能需要停止视频流或者清理相关资源
      console.log('停止摄像头流');
    }
  };
  </script>
  
  <style scoped>
  .camera-stream {
    text-align: center;
  }
  
  .camera-stream img {
    max-width: 100%;
    height: auto;
  }
  </style>
  