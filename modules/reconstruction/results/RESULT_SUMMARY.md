# Reconstruction Result Summary

- Total outputs: 5
- Results directory: `/home/wym/AAE5303-ChatGPT_spokesperson-group-Project/modules/reconstruction/results`

## Outputs

| File | Type | Size (MB) | Iteration | Vertices |
| --- | --- | ---: | ---: | ---: |
| `amtown02_vo_amtown02_10000/scene_gpu_safe_n10000_d3.ply` | ply | 128.58 | 10000 | 1296361 |
| `amtown02_vo_amtown02_20000/scene_gpu_safe_n20000_d3.ply` | ply | 132.80 | 20000 | 1338941 |
| `amtown02_vo_amtown02_30000/scene_gpu_safe_n30000_d3.ply` | ply | 190.70 | 30000 | 1922747 |
| `amtown02_vo_amtown02_40000/scene_gpu_safe_n40000_d3.ply` | ply | 179.29 | 40000 | 1807727 |
| `amtown02_vo_amtown02_safe/scene_gpu_safe_n500_d3.ply` | ply | 4.96 | 500 | 50000 |

## Camera Files

| File | Camera Count |
| --- | ---: |
| `amtown02_vo_amtown02_10000/cameras.json` | 622 |
| `amtown02_vo_amtown02_20000/cameras.json` | 622 |
| `amtown02_vo_amtown02_30000/cameras.json` | 622 |
| `amtown02_vo_amtown02_40000/cameras.json` | 622 |
| `amtown02_vo_amtown02_safe/cameras.json` | 622 |

## Recommended Files For Presentation

- `amtown02_vo_amtown02_30000/scene_gpu_safe_n30000_d3.ply`: the corrected AMtown02 rerun that displays reliably in PlayCanvas.
- `amtown02_vo_amtown02_40000/scene_gpu_safe_n40000_d3.ply`: the raw longest corrected rerun kept for comparison and debugging.
- `amtown02_vo_amtown02_safe/scene_gpu_safe_n500_d3.ply`: the smoke-test rerun proving that the corrected AMtown02 input is wired correctly.

## Notes

- This summary only lists the reruns generated after switching the VO-connected input back to the correct `AMtown02` dataset.
- Historical local outputs such as `amtown02_vo_refined_*`, `amtown02_quality_*`, and other earlier experiments are intentionally excluded from this GitHub-facing summary.
