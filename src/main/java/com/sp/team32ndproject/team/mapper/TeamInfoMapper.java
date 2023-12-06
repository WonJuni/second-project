package com.sp.team32ndproject.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.sp.team32ndproject.team.vo.TeamInfoVO;
import com.sp.team32ndproject.user.vo.UserInfoVO;

@Mapper
public interface TeamInfoMapper {
	int insertTeamInfo(TeamInfoVO team);
	TeamInfoVO selectTaTypeMatchBoardInfoByTaNum(int taNum);
	List<TeamInfoVO> selectTeamInfos(TeamInfoVO team);
	List<TeamInfoVO> selectTeamRank(TeamInfoVO team);
	UserInfoVO selectTaTypeMatchBoardInfoByUiNum(@AuthenticationPrincipal UserInfoVO user);
}
