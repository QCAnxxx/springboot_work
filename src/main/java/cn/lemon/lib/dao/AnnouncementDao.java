package cn.lemon.lib.dao;

import cn.lemon.lib.entity.Announcement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnnouncementDao extends JpaRepository<Announcement,Long> {
}
