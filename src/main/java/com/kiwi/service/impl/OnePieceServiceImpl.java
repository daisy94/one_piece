package com.kiwi.service.impl;

import com.kiwi.mapper.OnePieceMapper;
import com.kiwi.service.OnePieceService;
import com.kiwi.utils.KiwiUtils;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OnePieceServiceImpl implements OnePieceService {

    @Value("${photo.photo_url}")
    private String photo_url;

    @Value("${photo.photo_path}")
    private String photo_path;

    @Resource
    private OnePieceMapper onePieceMapper;

    // 按月份查询恰饭ECharts所需数据
    @Override
    public Map<String, Object> getOnePieceEChartsByYearMonth(Map<String, Object> params) {

        List<Map<String, Object>> onePieceEChartsByYearMonth = onePieceMapper.getOnePieceEChartsByYearMonth(params);
        return KiwiUtils.formatEChartsData(onePieceEChartsByYearMonth, "profit", "date");
    }

    // 按年份查询恰饭收入总和
    @Override
    public Map<String, Object> getOnePieceCountByYear(Map<String, Object> params) {
        return onePieceMapper.getOnePieceCountByYear(params);
    }

    // 新增姨妈周期数据
    @Override
    public void insertMenstruationCycleData(Map<String, Object> params) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.insertMenstruationCycleData(params);
    }

    // 查询姨妈周期表格所需数据
    @Override
    public List<Map<String, Object>> getMenstruationCycleTable(Map<String, Object> params) {

        /*List<Map<String, Object>> menstruationCycleTable = onePieceMapper.getMenstruationCycleTable(params);
        return KiwiUtils.formatDate(menstruationCycleTable, "start_time", "end_time");*/
        return null;
    }

    // 修改是否已发货状态
    @Override
    public void updateOnePieceDeliverState(Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.updateOnePieceDeliverState(params);
    }

    // 保存照片至服务器，保存照片信息至数据库
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void savePhotoAndData(MultipartFile file, Map<String, Object> params) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        String dateTime = sdf.format(new Date());
        String date = sdf2.format(new Date());
        // 获取文件名
        String fileName = file.getOriginalFilename();
        String toFileName = file.getOriginalFilename();
        String dateYearMonth = String.valueOf(params.get("photoAlbumName"));
        String photoTime = dateYearMonth.substring(0, 4) + "-" + dateYearMonth.substring(6, 8);
        params.put("updateTime", dateTime);
        if (fileName != null) {
            String[] split = fileName.split("\\.");
            fileName = date + "_" + dateTime + "." + split[1];
        }
        if (toFileName != null) {
            String[] split = toFileName.split("\\.");
            toFileName = date + "_thumbnail_" + dateTime + "." + split[1];
        }

        // 文件上传后的路径
        String filePath = photo_path + "memoryPhoto/" + photoTime + "/" + fileName;
        String toFilePath = photo_path + "memoryPhoto/" + photoTime + "/" + toFileName;
        params.put("photoUrl", photo_url + "memoryPhoto/" + photoTime + "/" + toFileName);
        /*String filePath = "C:\\image\\" + "memoryPhoto\\" + photoTime + "\\" + fileName;
        String toFilePath = "C:\\image\\" + "memoryPhoto\\" + photoTime + "\\" + toFileName;
        params.put("photoUrl", "C:\\image\\" + "memoryPhoto\\" + photoTime + "\\" + toFileName);*/
        onePieceMapper.insertPhotoInfo(params);
        params.put("thumbnailId", onePieceMapper.queryPhotoThumbnailId(params));
        params.put("photoOriginalUrl", photo_url + "memoryPhoto/" + photoTime + "/" + fileName);
        //params.put("photoOriginalUrl", "C:\\image\\" + "memoryPhoto\\" + photoTime + "\\" + fileName);
        params.put("createTime", new Date());
        onePieceMapper.insertPhotoOriginal(params);

        File photoFile = new File(filePath);
        File toPic = new File(toFilePath);
        // 检测是否存在目录
        if (photoFile.getParentFile().mkdirs()) {
            file.transferTo(photoFile);
        } else {
            file.transferTo(photoFile);
        }
        // 压缩原图
        Thumbnails.of(photoFile).scale(1f).outputQuality(0.2f).toFile(toPic);
    }

    // 查询该月份相册是否已经存在
    @Override
    public int queryPhotoAlbum(Map<String, Object> params) {
        return onePieceMapper.queryPhotoAlbum(params);
    }

    // 保存相册封面至服务器，保存相册封面信息至数据库
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void savePhotoCover(MultipartFile file, Map<String, Object> params) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
        String dateTime = sdf.format(new Date());
        String date = sdf2.format(new Date());
        // 获取文件名
        String fileName = file.getOriginalFilename();
        String toFileName = file.getOriginalFilename();
        params.put("photoAlbumDate", String.valueOf(params.get("dateYearMonth")));
        params.put("updateTime", dateTime);
        if (fileName != null) {
            String[] split = fileName.split("\\.");
            fileName = date + "_" + dateTime + "." + split[1];
        }
        if (toFileName != null) {
            String[] split = toFileName.split("\\.");
            toFileName = date + "_thumbnail_" + dateTime + "." + split[1];
        }

        // 文件上传后的路径
        String filePath = photo_path + "photo_album/" + fileName;
        String toFilePath = photo_path + "photo_album/" + toFileName;
        params.put("photoAlbumUrl", photo_url + "photo_album/" + toFileName);
        /*String filePath = "C:\\image\\" + fileName;
        String toFilePath = "C:\\image\\" + toFileName;
        params.put("photoAlbumUrl", "C:\\image\\" + "photo_album\\" + toFileName);*/
        onePieceMapper.insertPhotoAlbumInfo(params);

        File photoAlbumFile = new File(filePath);
        File toPic = new File(toFilePath);
        // 检测是否存在目录
        if (photoAlbumFile.getParentFile().mkdirs()) {
            file.transferTo(photoAlbumFile);
        } else {
            file.transferTo(photoAlbumFile);
        }
        // 压缩原图
        Thumbnails.of(photoAlbumFile).scale(1f).outputQuality(0.2f).toFile(toPic);
    }

    // 查询相册和相关信息
    @Override
    public List<Map<String, Object>> getPhotoAlbumInfo(Map<String, Object> params) {

        List<Map<String, Object>> photoAlbumInfo = onePieceMapper.getPhotoAlbumInfo(params);
        for (Map<String, Object> map : photoAlbumInfo) {
            String photoAlbumDateYear = String.valueOf(map.get("photoAlbumDate")).substring(0, 4);
            String photoAlbumDateMonth = String.valueOf(map.get("photoAlbumDate")).substring(4, 6);
            map.put("photoAlbumDate", photoAlbumDateYear + "年 " + photoAlbumDateMonth + "月");
        }
        return photoAlbumInfo;
    }

    // 查询照片和相关信息
    @Override
    public List<Map<String, Object>> getPhotoInfo(Map<String, Object> params) {
        return onePieceMapper.getPhotoInfo(params);
    }

    // 新增顾客信息
    @Override
    public void insertCustomer(Map<String, Object> params) {

        Date createTime = new Date();
        params.put("createTime", createTime);
        params.put("updateTime", createTime);
        onePieceMapper.insertCustomer(params);
    }

    // 查询顾客信息
    @Override
    public List<Map<String, Object>> getCustomerTable(Map<String, Object> params) {
        return onePieceMapper.getCustomerTable(params);
    }

    // 删除顾客数据
    @Override
    public void deleteCustomer(Map<String, Object> params) {

        Date updateTime = new Date();
        params.put("updateTime", updateTime);
        onePieceMapper.deleteCustomer(params);
    }

    // 修改顾客数据
    @Override
    public void updateCustomer(Map<String, Object> params) {

        Date updateTime = new Date();
        params.put("updateTime", updateTime);
        onePieceMapper.updateCustomer(params);
    }

    // 新增商品数据
    @Override
    public void insertProduct(Map<String, Object> params) {

        Date createTime = new Date();
        params.put("createTime", createTime);
        params.put("updateTime", createTime);
        onePieceMapper.insertProduct(params);
    }

    // 删除商品数据
    @Override
    public void deleteProduct(Map<String, Object> params) {

        Date updateTime = new Date();
        params.put("updateTime", updateTime);
        onePieceMapper.deleteProduct(params);
    }

    // 修改商品数据
    @Override
    public void updateProduct(Map<String, Object> params) {

        Date updateTime = new Date();
        params.put("updateTime", updateTime);
        onePieceMapper.updateProduct(params);
    }

    // 查询商品信息
    @Override
    public List<Map<String, Object>> getProductTable(Map<String, Object> params) {
        return onePieceMapper.getProductTable(params);
    }
    
}
