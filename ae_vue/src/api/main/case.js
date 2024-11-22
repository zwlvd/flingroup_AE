import request from '@/utils/request'

// 查询案例库列表
export function listCase(query) {
  return request({
    url: '/main/case/list',
    method: 'get',
    params: query
  })
}

// 查询案例库详细
export function getCase(caseId) {
  return request({
    url: '/main/case/' + caseId,
    method: 'get'
  })
}

// 查询视频可播放的案例库详细
export function getVideoCase(caseId) {
  return request({
    url: '/main/case/video/' + caseId,
    method: 'get'
  })
}


// 新增案例库
export function addCase(data) {
  return request({
    url: '/main/case',
    method: 'post',
    data: data
  })
}

// 修改案例库
export function updateCase(data) {
  return request({
    url: '/main/case',
    method: 'put',
    data: data
  })
}

// 删除案例库
export function delCase(caseId) {
  return request({
    url: '/main/case/' + caseId,
    method: 'delete'
  })
}
