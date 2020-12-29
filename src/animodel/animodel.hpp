#ifndef ANIMODEL_HPP_INCLUDED
#define ANIMODEL_HPP_INCLUDED

#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>

#include <cassert>
#include <vector>
#include <string>

struct AniModelMesh {
  std::vector<aiVector3D> vertexPositions{};
  std::vector<aiVector2D> vertexTextureCoordinates{};
};

struct AniModel {
  std::vector<AniModelMesh> meshes{};
};

void loadModel(AniModel* model, const void* pBuffer, size_t pLength);

#endif // ANIMODEL_HPP_INCLUDED
