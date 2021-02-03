package sungtae.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.BoardReplyDAO;
import sungtae.spring.mvc.vo.ReplyVO;

import java.util.List;
@Service("brsrv")
public class BoardReplyServiceImpl implements BoardReplyService{

    @Autowired private BoardReplyDAO brdao;

    @Override // 댓글/ 대댓글 가져오기
    public List<ReplyVO> readReply(String bno) {
        return brdao.selectReply(Integer.parseInt(bno));
    }

    @Override // 댓글 쓰기
    public boolean newReply(ReplyVO rvo) {
        int cnt = brdao.insertReply(rvo);
        return true;
    }

    @Override
    public boolean newReReply(ReplyVO rvo) {
        int cnt = brdao.insertReReply(rvo);
        return true;
    }
}
