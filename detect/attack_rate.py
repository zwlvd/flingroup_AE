import os
import json
import cv2
import numpy as np
import torch
from pycocotools.coco import COCO
from pycocotools.cocoeval import COCOeval


def load_coco_data(gt_file):
    # 加载ground truth数据
    coco_gt = COCO(gt_file)

    # 提取类别映射
    categories = coco_gt.loadCats(coco_gt.getCatIds())
    category_mapping = {cat["name"]: cat["id"] for cat in categories}

    return coco_gt, category_mapping


def detect_images(image_dir, model, coco_gt, category_mapping):
    # 获取所有图像的ID
    image_ids = coco_gt.getImgIds()

    results = []

    for img_id in image_ids:
        # 获取图像信息
        img_info = coco_gt.loadImgs(img_id)[0]
        image_path = os.path.join(image_dir, img_info["file_name"])

        # 读取图像
        image = cv2.imread(image_path)
        if image is None:
            print(f"Error reading image: {image_path}")
            continue

        # 转换图像格式
        image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

        # 检测
        with torch.no_grad():
            results_list = model([image_rgb])

        # 处理检测结果
        for detection in results_list.xyxy[0]:
            x_min, y_min, x_max, y_max, conf, class_id = detection.tolist()
            class_name = model.names[int(class_id)]
            # 查找对应的类别ID
            if class_name in category_mapping:
                category_id = category_mapping[class_name]
            else:
                continue  # 如果类别名称不在映射中，跳过该检测结果

            bbox = [x_min, y_min, x_max - x_min, y_max - y_min]
            result = {
                "image_id": img_id,
                "category_id": category_id,
                "bbox": bbox,
                "score": float(conf),
            }
            results.append(result)

    return results


def save_results(results, output_file):
    with open(output_file, "w") as f:
        json.dump(results, f)


def evaluate_model(coco_gt, results_file):
    # 加载预测结果
    with open(results_file, "r") as f:
        predictions = json.load(f)

    # 创建COCO格式的预测对象
    coco_dt = coco_gt.loadRes(predictions)

    # 创建评估对象
    coco_eval = COCOeval(coco_gt, coco_dt, "bbox")

    # 运行评估
    coco_eval.evaluate()
    coco_eval.accumulate()
    coco_eval.summarize()

    # 获取类别ID
    cat_ids = coco_gt.getCatIds()

    # 初始化一个字典来存储每个类别的AP
    category_ap = {}

    # 遍历每个类别ID
    for cat_id in cat_ids:
        # 设置当前评估的类别ID
        coco_eval.params.catIds = [cat_id]

        # 重新评估
        coco_eval.evaluate()
        coco_eval.accumulate()

        # 获取当前类别的AP
        coco_eval.summarize()
        ap = coco_eval.stats[0]  # AP@[ IoU=0.50:0.95 | area=all | maxDets=100 ]

        # 获取类别名称
        cat_name = coco_gt.loadCats(cat_id)[0]["name"]

        # 存储结果
        category_ap[cat_name] = ap

    # 打印每个类别的AP
    for cat_name, ap in category_ap.items():
        print(f"Category: {cat_name}, AP: {ap:.3f}")


def calculate_iou(box1, box2):
    # 计算两个边界框的交并比
    x1 = max(box1[0], box2[0])
    y1 = max(box1[1], box2[1])
    x2 = min(box1[0] + box1[2], box2[0] + box2[2])
    y2 = min(box1[1] + box1[3], box2[1] + box2[3])

    intersection = max(0, x2 - x1) * max(0, y2 - y1)
    area1 = box1[2] * box1[3]
    area2 = box2[2] * box2[3]
    union = area1 + area2 - intersection

    return intersection / union if union > 0 else 0.0


def calculate_missed_frames(coco_gt, results_file, conf_thres, iou_thres):
    # 加载预测结果
    with open(results_file, "r") as f:
        predictions = json.load(f)

    # 创建COCO格式的预测对象
    coco_dt = coco_gt.loadRes(predictions)

    missed_frames = 0

    # 获取所有图像的ID
    image_ids = coco_gt.getImgIds()

    for img_id in image_ids:
        gt_anns = coco_gt.imgToAnns[img_id]
        dt_anns = [ann for ann in predictions if ann["image_id"] == img_id]

        # 假设如果有一个真实框未被正确检测，则该帧视为missed
        all_detected = True
        for gt_ann in gt_anns:
            detected = False
            for dt_ann in dt_anns:
                if dt_ann["score"] >= conf_thres:
                    iou = calculate_iou(gt_ann["bbox"], dt_ann["bbox"])
                    if iou >= iou_thres:
                        detected = True
                        break
            if not detected:
                all_detected = False
                break
        if not all_detected:
            missed_frames += 1

    print(
        f"Missed Frames (Conf: {conf_thres}, IOU: {iou_thres}): {missed_frames}/{len(image_ids)}"
    )
    return missed_frames


def main():
    image_dir = "real_data"
    gt_file = f"{image_dir}/result.json"
    output_file = "predictions.json"

    # 加载ground truth数据并提取类别映射
    coco_gt, category_mapping = load_coco_data(gt_file)

    # 加载 YOLOv5 模型
    model = torch.hub.load("ultralytics/yolov5", "yolov5s", pretrained=True)
    model.eval()

    # 检测图像并保存结果
    results = detect_images(image_dir, model, coco_gt, category_mapping)
    save_results(results, output_file)

    # 评估模型
    evaluate_model(coco_gt, output_file)

    # 计算missed frames
    conf_thres = 0.5  # 设置你的置信度阈值
    iou_thres = 0.5  # 设置你的IOU阈值
    missed_frames = calculate_missed_frames(coco_gt, output_file, conf_thres, iou_thres)


if __name__ == "__main__":
    main()
