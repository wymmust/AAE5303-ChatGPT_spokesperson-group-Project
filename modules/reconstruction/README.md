# 🏗️ AAE5303 3D Reconstruction

This folder contains the **module-facing** 3D reconstruction documentation:

- Which datasets and input formats are used
- Which result files are considered the final outputs
- How the reconstruction pipeline is reproduced with OpenSplat
- How the main reconstruction result and the VO-connected result should be interpreted

If you are looking for a practical “how to run OpenSplat without common pitfalls” guide, see:

- `OPENSPLAT_TIPS.md`

## 📌 Reconstruction Dataset

The reconstruction experiments in this project are based on the **AMtown02** sequence.

The reconstruction module uses:

- **AMtown02 image sequence**
- **COLMAP-format sparse reconstruction**
- **Camera poses exported from either the richer baseline input or the VO-connected input**

| Resource | Link |
|----------|------|
| MARS-LVIG Dataset (AMtown02) | https://mars.hku.hk/dataset.html |
| UAVScenes GitHub | https://github.com/sijieaaa/UAVScenes |
| OpenSplat | https://github.com/pierotofy/OpenSplat |

All sequences used in this module are sourced from the **official MARS-LVIG AMtown02** dataset.

## 📌 What this module produces

This module produces **3D Gaussian scene files** and summary artifacts:

- Final scene files in `.ply` format
- Optional lightweight `.splat` files for viewer demos
- `cameras.json` files for supported viewers
- Lightweight summaries in Markdown and JSON

If you want a structured description of the final result format, see:

- `RECONSTRUCTION_RESULTS_GUIDE.md`

## 📊 Final Results

The repository currently keeps two main reconstruction outcomes:

| Result | Input Source | Iterations | Camera Poses | Vertices | Size | Purpose |
|--------|--------------|------------|--------------|----------|------|---------|
| **Main Reconstruction** | `colmap_from_amtown02` | 6000 | 292 | 704292 | 166.57 MB | Best scene quality |
| **VO-Connected Reconstruction** | `colmap_from_vo` | 25000 | 65 | 3555460 | 352.64 MB | End-to-end group pipeline result |

### Main reconstruction result

- File: `results/amtown02_quality_balanced_6000.ply`
- Best overall quality and scene stability
- Recommended as the main reconstruction result for GitHub and final reporting

### VO-connected reconstruction result

- File: `results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply`
- Generated from the VO pipeline output
- Much denser than earlier VO-based runs, but still limited by lower pose coverage

## 📈 What the comparison means

### Main reconstruction result

The main reconstruction result uses a richer COLMAP input with more camera poses and more stable geometry. It therefore provides better scene completeness and is the strongest result for demonstrating reconstruction quality.

### VO-connected reconstruction result

The VO-connected reconstruction result proves that the group pipeline can run end to end from visual odometry to 3D reconstruction. Its quality is still constrained by the smaller number of VO poses, but longer OpenSplat training makes the result much denser than earlier VO-based runs.

## ✅ How to reproduce the same results locally

Run one of the preset commands from this directory:

```bash
./scripts/run_opensplat.sh amtown02_quality
./scripts/run_opensplat.sh amtown02_compact
./scripts/run_opensplat.sh vo_safe
```

For result summaries:

```bash
python3 ./scripts/summarize_results.py
```

This generates:

- `results/reconstruction_summary.json`
- `results/RESULT_SUMMARY.md`

## 📂 Repository-safe outputs

For GitHub, keep:

- Documentation files
- Scripts
- Lightweight JSON/Markdown summaries

Avoid committing:

- Large `.ply` and `.splat` binaries
- Local build trees
- Local dataset copies

## 🚀 Recommended files for GitHub

- `README.md`
- `modules/reconstruction/README.md`
- `modules/reconstruction/RECONSTRUCTION_RESULTS_GUIDE.md`
- `modules/reconstruction/OPENSPLAT_TIPS.md`
- `modules/reconstruction/result_template.json`
- `modules/reconstruction/scripts/run_opensplat.sh`
- `modules/reconstruction/scripts/summarize_results.py`
- `modules/reconstruction/results/RESULT_SUMMARY.md`
- `modules/reconstruction/results/reconstruction_summary.json`
- `modules/reconstruction/results/baseline_report.json`
