package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AddCarController {

    @Autowired
    JedisPool jedisPool;

    @RequestMapping("/addCar")
    public String addCar(@RequestParam String pid,@RequestParam String username){
        //购物车存储结构
        //redis的hmset存储：hmset是一个map集合，该集合的key存储username(用户名)
        //value存储一个map集合，其中这个map集合的key存储pid(商品唯一标识)，value存储
        //的是用户购物车每个商品的数量

        Jedis jedis = jedisPool.getResource();//获取Jedis对象
        //1.判断用户购物车里有没有商品：hgetAll通过用户名得到value
        //1.1如果value不为空，说明有商品，直接添加
        //1.2如果value为空，那么需要创建一盒map集合

        Map<String,String> map = jedis.hgetAll(username);
        if(map.isEmpty()){
            map = new HashMap<String,String>();
            map.put(pid,"1");
            jedis.hmset(username,map);//存入redis中
        }else{
            if(map.containsKey(pid)){
                map.put(pid,String.valueOf(Integer.parseInt(map.get(pid))+1));
                jedis.hmset(username,map);//存入redis中
            }else{
                map.put(pid,"1");
                jedis.hmset(username,map);//存入redis中
            }
        }
        return "";
    }
}
