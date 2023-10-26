package cn.lemon.lib.service;


import cn.lemon.lib.dao.AnnouncementDao;
import cn.lemon.lib.entity.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementService {
    @Autowired
    AnnouncementDao announcementDao;

    /**
     * 增加数据
     */
    public void add(Announcement announcement)
    {
        announcementDao.save(announcement);
    }

    /**
     * 删除数据
     */
    public void delete(Announcement announcement)
    {
        announcementDao.delete(announcement);
    }

    /**
     * 更改数据
     */
    public Announcement update(Announcement announcement)
    {
        return announcementDao.save(announcement);
    }

    /**
     * 查找当前分页数据
     */
    public List<Announcement> findAll(int page,int limit){
        PageRequest pageable=PageRequest.of(page,limit);
        Page<Announcement> all = announcementDao.findAll(pageable);
        List<Announcement> content = all.getContent();
        return content;
    }
}
