#include "animodel.hpp"

void processNode(AniModel* model, const aiNode* node, const aiScene* scene);
AniModelMesh processMesh(const aiMesh* mesh);

void loadModel(AniModel* model, const void* pBuffer, size_t pLength) {
  Assimp::Importer importer{};
  const aiScene* scene = importer.ReadFileFromMemory(pBuffer, pLength, 0, "gltf");
  assert(scene);
  assert(!(scene->mFlags & AI_SCENE_FLAGS_INCOMPLETE));
  assert(scene->mRootNode);

  processNode(model, scene->mRootNode, scene);
}

void processNode(AniModel* model, const aiNode* node, const aiScene* scene) {
  for (unsigned int i = 0; i < node->mNumMeshes; ++i) {
    aiMesh* mesh = scene->mMeshes[node->mMeshes[i]];
    model->meshes.push_back(processMesh(mesh));
  }

  for (unsigned int i = 0; i < node->mNumChildren; ++i) {
    processNode(model, node->mChildren[i], scene);
  }
}

AniModelMesh processMesh(const aiMesh* mesh) {
  AniModelMesh amMesh{};

  amMesh.vertexPositions.reserve(mesh->mNumVertices);
  amMesh.vertexPositions.resize(mesh->mNumVertices);

  for (unsigned int i = 0; i < mesh->mNumVertices; ++i) {
    amMesh.vertexPositions[i] = mesh->mVertices[i];
  }

  if (!mesh->mTextureCoords[0]) {
    return amMesh;
  }

  amMesh.vertexTextureCoordinates.reserve(mesh->mNumVertices);
  amMesh.vertexTextureCoordinates.resize(mesh->mNumVertices);

  for (unsigned int i = 0; i < mesh->mNumVertices; ++i) {
    amMesh.vertexTextureCoordinates[i].x = mesh->mTextureCoords[0][i].x;
    amMesh.vertexTextureCoordinates[i].y = mesh->mTextureCoords[0][i].y;
  }

  return amMesh;
}
