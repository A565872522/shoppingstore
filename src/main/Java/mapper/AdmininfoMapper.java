package mapper;

import entity.Admininfo;
import org.apache.ibatis.annotations.Param;

public interface AdmininfoMapper {

    Admininfo selectByAdName(String adName);

    int deleteByPrimaryKey(Integer adId);

    int insert(Admininfo record);

    int insertSelective(Admininfo record);

    Admininfo selectByPrimaryKey(Integer adId);

    int updateByPrimaryKeySelective(Admininfo record);

    int updateByPrimaryKey(Admininfo record);
}