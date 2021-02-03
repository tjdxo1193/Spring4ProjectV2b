package sungtae.spring.mvc.service;

import sungtae.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyService {
    List<ReplyVO> readReply(String bno);

    boolean newReply(ReplyVO rvo);

    boolean newReReply(ReplyVO rvo);
}
