# 3D Reconstruction Presentation Notes

## Slide Title

3D Reconstruction Results: Main Scene Quality vs VO-Connected Pipeline

## Recommended Assets

- Main quality result: `modules/reconstruction/results/amtown02_quality_balanced_6000.ply`
- VO-connected result: `modules/reconstruction/results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply`

## Key Numbers

- Main quality result: 6000 iterations, 704292 vertices, about 166.57 MB, 292 camera poses.
- VO-connected result: 25000 iterations, 3555460 vertices, about 352.64 MB, 65 camera poses.

## Comparison Table

| Item | Main Quality Result | VO-Connected Result |
| --- | --- | --- |
| File | `amtown02_quality_balanced_6000.ply` | `scene_gpu_safe_n25000_d3.ply` |
| Input source | `colmap_from_amtown02` | `colmap_from_vo` |
| Camera poses | 292 | 65 |
| Iterations | 6000 | 25000 |
| Vertices | 704292 | 3555460 |
| Visual impression | Best overall quality | Much denser than earlier VO runs, but still limited by VO input |
| Presentation role | Main reconstruction showcase | Proof of module integration |

## Suggested Storyline

1. We used OpenSplat to reconstruct a 3D Gaussian scene from COLMAP-format inputs.
2. The main result used a richer input with more camera poses, so it produced the best visual quality.
3. We also connected the VO output to the reconstruction module and successfully generated a separate scene.
4. The VO-connected result is much denser than our earlier VO-based runs, but it is still limited by the sparse VO input and lower camera coverage.

## Suggested English Script

This slide shows two reconstruction results. The left result is our main high-quality scene, generated from a richer COLMAP input with 292 camera poses. It gives the best visual quality and is the result we use to present the reconstruction capability of our module.

The right result is our VO-connected reconstruction. It is generated from the VO pipeline output and uses only 65 camera poses, so the scene is still less complete than the main result. However, after increasing training to 25000 iterations, it becomes much denser and demonstrates that the group pipeline can run end to end from visual odometry to 3D reconstruction.

## Suggested One-Sentence Conclusion

The main reconstruction result demonstrates the best scene quality, while the VO-connected result demonstrates successful integration between group modules.
