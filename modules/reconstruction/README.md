# 3D Reconstruction

This module contains the 3D scene reconstruction workflow based on OpenSplat.

## Current Status

- `baseline/colmap_from_amtown02`: the main COLMAP-format input used to produce the existing high-quality reconstructions.
- `baseline/colmap_from_vo`: the VO-driven COLMAP-format input used to test the group pipeline connection.
- `results/`: generated `.ply`, `.splat`, and `cameras.json` outputs.
- `opensplat_cpu_src/build_cuda/opensplat`: compiled OpenSplat binary.

## Recommended Deliverables

- `results/amtown02_quality_balanced_6000.ply`: best quality result for presentation.
- `results/amtown02_gpu_final_2000.splat`: lightweight result for viewer demos.
- `results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply`: strongest VO-driven reconstruction result.

## Reproduce Existing Results

Run one of the presets below from this directory:

```bash
./scripts/run_opensplat.sh amtown02_quality
./scripts/run_opensplat.sh amtown02_compact
./scripts/run_opensplat.sh vo_safe
```

## Generate A Result Summary

```bash
python3 ./scripts/summarize_results.py
```

This writes:

- `results/reconstruction_summary.json`
- `results/RESULT_SUMMARY.md`

## Presentation Suggestions

- Use `amtown02_quality_balanced_6000.ply` as the main visual example.
- Use `amtown02_gpu_final_2000.splat` if you need a smaller file for online viewers.
- Use `amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply` to present the latest VO-driven reconstruction result.
- Compare the regular reconstruction input and the VO-driven input to explain module integration.
- Highlight the trade-off between iteration count, file size, and visual quality.
