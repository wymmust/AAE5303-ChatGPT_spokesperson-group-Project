# Result Comparison Slide

## Title

3D Reconstruction: Main Result and VO-Connected Result

## Two-Column Content

### Left: Main Reconstruction Result

- File: `modules/reconstruction/results/amtown02_quality_balanced_6000.ply`
- Input: `modules/reconstruction/baseline/colmap_from_amtown02`
- 292 camera poses
- 6000 iterations
- 704292 vertices
- Best overall scene completeness and detail

### Right: VO-Connected Reconstruction Result

- File: `modules/reconstruction/results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply`
- Input: `modules/reconstruction/baseline/colmap_from_vo`
- 65 camera poses
- 25000 iterations
- 3555460 vertices
- Much denser than earlier VO-based runs
- Useful for demonstrating module integration

## Speaker Notes

The left result is our strongest reconstruction output and should be treated as the main result for quality evaluation. It uses a denser input and therefore reconstructs a more complete scene.

The right result is based on the VO pipeline output. Its scene quality is still constrained by fewer poses and fewer sparse points, but after 20000 iterations it becomes much denser and demonstrates that our group pipeline can connect visual odometry with 3D reconstruction successfully.

## Final Takeaway

Use the left result to present reconstruction quality, and use the right result to present pipeline integration.
