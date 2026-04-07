# AAE5303 - Reconstruction Submission Guide

## 📁 Reconstruction Inputs

The reconstruction module uses COLMAP-format inputs and OpenSplat training.

Current input sources:

| Input | Description |
|-------|-------------|
| `baseline/colmap_from_amtown02` | Richer COLMAP input used as a reference-quality baseline |
| `baseline/colmap_from_vo` | VO-connected COLMAP input used for the final end-to-end reconstruction comparison |

---

## 📊 Final Result Structure

Each final reconstruction result is described by:

- Input source
- Iteration count
- Output scene file
- Camera pose count
- Vertex count
- File size

### Final selected reconstruction result

```json
{
  "result_name": "vo_connected_reconstruction_final",
  "input_source": "colmap_from_vo",
  "scene_file": "results/amtown02_vo_refined_40000_gpu/scene_gpu_safe_n40000_d3.ply",
  "iterations": 40000,
  "camera_poses": 65,
  "vertices": 4798659,
  "size_mb": 475.94
}
```

---

## 📈 Iteration Comparison Used In The Report

The final report should compare the following six VO-connected runs:

| Version | Scene File | Iterations | Camera Poses | Vertices | Size (MB) |
|--------|------------|-----------:|-------------:|---------:|----------:|
| V1 | `results/amtown02_vo_refined_10000_fresh/scene_gpu_safe_n10000_d3.ply` | 10000 | 65 | 1390913 | 137.95 |
| V2 | `results/amtown02_vo_refined_15000/scene_gpu_safe_n15000_d3.ply` | 15000 | 65 | 2081187 | 206.42 |
| V3 | `results/amtown02_vo_refined_20000/scene_gpu_safe_n20000_d3.ply` | 20000 | 65 | 2765440 | 274.28 |
| V4 | `results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply` | 25000 | 65 | 3555460 | 352.64 |
| V5 | `results/amtown02_vo_refined_30000_gpu/scene_gpu_safe_n30000_d3.ply` | 30000 | 65 | 4499683 | 446.29 |
| V6 | `results/amtown02_vo_refined_40000_gpu/scene_gpu_safe_n40000_d3.ply` | 40000 | 65 | 4798659 | 475.94 |

Use `V6` as the final selected version in repository-facing documentation.

---

## 💡 How to interpret the results

### VO-connected reconstruction result progression

- All comparison runs use the same `colmap_from_vo` input with 65 camera poses.
- The main variable is the total number of OpenSplat iterations.
- Higher iteration counts consistently increase the final number of vertices and scene density.
- The 40000-iteration version is the strongest final result among the compared runs.
- The improvement from 30000 to 40000 is smaller than the earlier gains, so the experiment is stopped at 40000 instead of pushing to a much higher value on the same 4GB GPU.

---

## 🔢 Lightweight summaries

This module generates two lightweight summary files:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`

These files are recommended for GitHub uploads because they preserve key metrics without committing large binary scene files.

---

## 📂 Repository Result Files

The following lightweight files are intended to stay in the repository:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`
- `results/baseline_report.json`

---

## 📄 Submission Template

Use:

- `final_candidate/submission_template.json`
