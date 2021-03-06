package serviceimpl;

import entity.Adminhandle;
import entity.Admininfo;
import mapper.AdmininfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdmininfoService;

import java.util.List;

@Service
public class AdmininfoServiceImpl implements AdmininfoService {
    @Autowired
    AdmininfoMapper am;

    @Override
    public List<Adminhandle> selectAllMessage() {
        return am.selectAllMessage();
    }

    @Override
    public List<Adminhandle> selectAllHandle() {
        return am.selectAllHandle();
    }

    @Override
    public Admininfo selectByAdName(String adName) {
        return am.selectByAdName(adName);
    }

    @Override
    public int deleteByPrimaryKey(Integer adId) {
        return am.deleteByPrimaryKey(adId);
    }

    @Override
    public int insert(Admininfo record) {
        return am.insert(record);
    }

    @Override
    public int insertSelective(Admininfo record) {
        return am.insertSelective(record);
    }

    @Override
    public Admininfo selectByPrimaryKey(Integer adId) {
        return am.selectByPrimaryKey(adId);
    }

    @Override
    public int updateByPrimaryKeySelective(Admininfo record) {
        return am.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Admininfo record) {
        return am.updateByPrimaryKey(record);
    }
}
