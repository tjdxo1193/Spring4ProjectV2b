package sungtae.spring.mvc.dao;

import sungtae.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
    List<ReplyVO> selectReply(String bno);
}
