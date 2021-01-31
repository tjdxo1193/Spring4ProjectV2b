package sungtae.spring.mvc.service;

import sungtae.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean removeBoard(String bno);
    int countBoard();
    boolean viewCountBoard(String bno);
}
