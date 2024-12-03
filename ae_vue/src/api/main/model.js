import request from '@/utils/request'

// 查询算法模型列表
export function listModel(query) {
  return request({
    url: '/main/model/list',
    method: 'get',
    params: query
  })
}

// 查询算法模型详细
export function getModel(modelId) {
  return request({
    url: '/main/model/' + modelId,
    method: 'get'
  })
}

// 新增算法模型
export function addModel(data) {
  return request({
    url: '/main/model',
    method: 'post',
    data: data
  })
}

// 修改算法模型
export function updateModel(data) {
  return request({
    url: '/main/model',
    method: 'put',
    data: data
  })
}

// 删除算法模型
export function delModel(modelId) {
  return request({
    url: '/main/model/' + modelId,
    method: 'delete'
  })
}
