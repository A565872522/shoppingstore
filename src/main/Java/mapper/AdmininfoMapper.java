package mapper;

import entity.Adminhandle;
import entity.Admininfo;
import java.util.List;

public interface AdmininfoMapper {

    List<Adminhandle> selectAllHandle();

    Admininfo selectByAdName(String adName);

    int deleteByPrimaryKey(Integer adId);

    int insert(Admininfo record);

    int insertSelective(Admininfo record);

    Admininfo selectByPrimaryKey(Integer adId);

    int updateByPrimaryKeySelective(Admininfo record);

    int updateByPrimaryKey(Admininfo record);
}