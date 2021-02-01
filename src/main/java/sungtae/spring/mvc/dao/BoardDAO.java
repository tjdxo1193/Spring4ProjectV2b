package sungtae.spring.mvc.dao;

import sungtae.spring.mvc.vo.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
    int insertBoard(BoardVO bvo);
    List<BoardVO> selectBoard(int snum);
    BoardVO selectOneBoard(String bno);
    int updateBoard(BoardVO bvo);
    int deleteBoard(String bno);
    int selectCountBoard();
    int updateViewCount(String bno);

    int selectCountBoard(Map<String, String> param);

    List<BoardVO> findSelectList(Map<String, Object> param);
}
