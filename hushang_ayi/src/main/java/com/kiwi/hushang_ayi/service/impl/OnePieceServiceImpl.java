package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.OnePieceMapper;
import com.kiwi.hushang_ayi.service.OnePieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import utils.KiwiUtils;
import utils.TypeUtil;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OnePieceServiceImpl implements OnePieceService {

    @Value("${photo.photo_url}")
    private String photo_url;

    @Value("${photo.photo_path}")
    private String photo_path;

    @Autowired
    private OnePieceMapper onePieceMapper;

    // 新增恰饭收入数据
    @Override
    public void insertOnePieceData (Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.insertOnePieceData(params);
    }

    // 删除恰饭收入数据
    @Override
    public void deleteOnePieceTableData (Map<String, Object> params) {
        onePieceMapper.deleteOnePieceTableData(params);
    }

    // 修改恰饭收入数据
    @Override
    public void updateOnePieceTableData (Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.updateOnePieceTableData(params);
    }

    // 按月份查询恰饭表格所需数据
    @Override
    public List<Map<String, Object>> getOnePieceDataByYearMonth (Map<String, Object> params) {

        List<Map<String, Object>> onePieceDataByYearMonth = onePieceMapper.getOnePieceDataByYearMonth(params);
        return KiwiUtils.formatDate(onePieceDataByYearMonth, "date");
    }

    // 按年份查询恰饭表格所需数据
    @Override
    public List<Map<String, Object>> getOnePieceDataByYear (Integer params) {

        List<Map<String, Object>> onePieceDataByYear = onePieceMapper.getOnePieceDataByYear(params);
        return KiwiUtils.formatDate(onePieceDataByYear, "date");
    }

    // 按月份查询恰饭ECharts所需数据
    @Override
    public Map<String, Object> getOnePieceEChartsByYearMonth (Map<String, Object> params) {

        List<Map<String, Object>> onePieceEChartsByYearMonth = onePieceMapper.getOnePieceEChartsByYearMonth(params);
        List<Map<String, Object>> maps = KiwiUtils.formatDate(onePieceEChartsByYearMonth, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    // 按年份查询恰饭ECharts所需数据
    @Override
    public Map<String, Object> getOnePieceEChartsByYear (Map<String, Object> params) {

        List<Map<String, Object>> dateYear = onePieceMapper.getOnePieceDataByYear(TypeUtil.toInt(params.get("dateYear")));
        List<Map<String, Object>> maps = KiwiUtils.formatDate(dateYear, "date");
        return KiwiUtils.formatEChartsData(maps, "profit", "date");
    }

    // 按年份查询恰饭收入总和
    @Override
    public Map<String, Object> getOnePieceCountByYear (Map<String, Object> params) {
        return onePieceMapper.getOnePieceCountByYear(params);
    }

    // 按月份查询恰饭收入目标业绩百分比
    @Override
    public Map<String, Object> getAchievementPercentage (Map<String, Object> params) {

        DecimalFormat df = new DecimalFormat("#.00");
        Map<String, Object> onePieceCountByMonth = onePieceMapper.getOnePieceCountByMonth(params);
        Map<String, Object> result = new HashMap<>();
        double profitCount = Double.parseDouble(String.valueOf(onePieceCountByMonth.get("profit")));
        double targetProfit = 5000;
        String achievementPercentage = df.format((profitCount / targetProfit * 100));
        result.put("achievementPercentage", achievementPercentage);
        return result;
    }

    // 新增姨妈周期数据
    @Override
    public void insertMenstruationCycleData (Map<String, Object> params) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.insertMenstruationCycleData(params);
    }

    // 查询姨妈周期表格所需数据
    @Override
    public List<Map<String, Object>> getMenstruationCycleTable (Map<String, Object> params) {

        List<Map<String, Object>> menstruationCycleTable = onePieceMapper.getMenstruationCycleTable(params);
        return KiwiUtils.formatDate(menstruationCycleTable, "start_time", "end_time");
    }

    // 修改是否已发货状态
    @Override
    public void updateOnePieceDeliverState (Map<String, Object> params) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String updateTime = sdf.format(new Date());
        params.put("updateTime", updateTime);
        onePieceMapper.updateOnePieceDeliverState(params);
    }

    // 查询参与抽奖顾客信息
    @Override
    public Map<String, Object> getLuckDrawData (Map<String, Object> params) {

        List<Map<String, Object>> luckDrawData = onePieceMapper.getLuckDrawData(params);
        int size = luckDrawData.size();
        Random random = new Random();
        int i = random.nextInt(size);
        return luckDrawData.get(i);
    }

    // 保存照片至服务器，保存照片信息至数据库
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void savePhotoAndData(MultipartFile file, Map<String, Object> params) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateTime = sdf.format(new Date());
        // 获取文件名
        String fileName = file.getOriginalFilename();
        params.put("photoName", String.valueOf(params.get("photoName")));
        params.put("updateTime", dateTime);
        if (fileName != null){
            String[] split = fileName.split("\\.");
            fileName = split[0] + dateTime + "." + split[1];
        }

        // 文件上传后的路径
        String filePath = photo_path;
        String photoTime = String.valueOf(params.get("photoAlbumName"));
        filePath = filePath + photoTime + "/" + fileName;
        params.put("photoUrl", photo_url + photoTime + "/" + fileName);
        onePieceMapper.insertPhotoInfo(params);

        File photoFile = new File(filePath);
        // 检测是否存在目录
        if (photoFile.getParentFile().mkdirs()){
            file.transferTo(photoFile);
        } else{
            file.transferTo(photoFile);
        }
    }

    // 保存相册封面至服务器，保存相册封面信息至数据库
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void savePhotoCover(MultipartFile file, Map<String, Object> params) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateTime = sdf.format(new Date());
        // 获取文件名
        String fileName = file.getOriginalFilename();
        params.put("photoAlbumDate", String.valueOf(params.get("dateYearMonth")));
        params.put("updateTime", dateTime);
        if (fileName != null){
            String[] split = fileName.split("\\.");
            fileName = split[0] + dateTime + "." + split[1];
        }

        // 文件上传后的路径
        String filePath = photo_path;
        filePath = filePath + "photo_album/" + fileName;
        params.put("photoAlbumUrl", photo_url + "photo_album/" + fileName);
        onePieceMapper.insertPhotoAlbumInfo(params);

        File photoAlbumFile = new File(filePath);
        // 检测是否存在目录
        if (photoAlbumFile.getParentFile().mkdirs()){
            file.transferTo(photoAlbumFile);
        } else{
            file.transferTo(photoAlbumFile);
        }
    }

    // 查询相册和相关信息
    @Override
    public List<Map<String, Object>> getPhotoAlbumInfo(Map<String, Object> params) {

        List<Map<String, Object>> photoAlbumInfo = onePieceMapper.getPhotoAlbumInfo(params);
        for (Map<String, Object> map : photoAlbumInfo){
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
}
