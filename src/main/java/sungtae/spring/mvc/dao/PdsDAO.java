package sungtae.spring.mvc.dao;


import sungtae.spring.mvc.vo.PdsVO;

import java.util.List;

public interface PdsDAO {
    int insertPds(PdsVO pvo);

    List<PdsVO> selectPds(int snum);

    int selectCountPds();
}
