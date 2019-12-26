package service;

import entity.Adminhandle;
import entity.Admininfo;

import java.util.List;

public interface AdmininfoService {

    List<Adminhandle> selectAllMessage();

    List<Adminhandle> selectAllHandle();

    Admininfo selectByAdName(String adName);

    int deleteByPrimaryKey(Integer adId);

    int insert(Admininfo record);

    int insertSelective(Admininfo record);

    Admininfo selectByPrimaryKey(Integer adId);

    int updateByPrimaryKeySelective(Admininfo record);

    int updateByPrimaryKey(Admininfo record);
}
