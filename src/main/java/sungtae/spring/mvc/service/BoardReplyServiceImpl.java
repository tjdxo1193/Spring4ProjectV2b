package sungtae.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.BoardReplyDAO;
import sungtae.spring.mvc.vo.ReplyVO;

import java.util.List;
@Service("brsrv")
public class BoardReplyServiceImpl implements BoardReplyService{

    @Autowired private BoardReplyDAO brdao;

    @Override
    public List<ReplyVO> readReply(String bno) {
        return brdao.selectReply(bno);
    }
}
