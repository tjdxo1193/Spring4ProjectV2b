package sungtae.spring.mvc.dao;

import sungtae.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
    List<ReplyVO> selectReply(int bno);

    int insertReply(ReplyVO rvo);

    int insertReReply(ReplyVO rvo);
}
