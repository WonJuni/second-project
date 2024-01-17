package com.sp.team32ndproject.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.sp.team32ndproject.team.vo.MsgVO;
import com.sp.team32ndproject.team.vo.TeamInfoVO;
import com.sp.team32ndproject.team.vo.TeamUserInfoVO;
import com.sp.team32ndproject.user.vo.UserInfoVO;

@Mapper
public interface TeamUserInfoMapper {
	int insertTeamUserInfo(TeamUserInfoVO teamUser);

	List<TeamUserInfoVO> selectTeamUserInfosWithHelper(TeamUserInfoVO teamUserInfoVO);

	int deleteTeamUserInfo(int tuNum);

	List<TeamUserInfoVO> selectTeamUsersByTaNum(int taNum);

	int updateTeamUserInfos(int tuNum);

	TeamUserInfoVO selectTeamUserInfo(int taNum, int tuNum);

	TeamUserInfoVO selectTeamUserInfos(TeamUserInfoVO teamUserInfoVO);

	int deleteTeamUser(TeamUserInfoVO teamUserInfo);

	TeamUserInfoVO TeamUserRole(TeamUserInfoVO teamUserInfo);

	List<TeamUserInfoVO> selectTeamByTaNum(int taNum);
	
	List<TeamUserInfoVO> selectTeamUserInfoByUiNum(int uiNum);

	TeamUserInfoVO TeamUserRole(int uiNum, int taNum);

}
