# GeneralizedDiffusionMap

"Generalised diffusion map" provides extensions of the diffusion maps construction. 
For more details see Banisch, Trstanova, Bittracher, Klus and Koltai 2017.
		
		TMDmap: target measure diffusion maps, generalizes diffusion maps (Coifman & Lafon)
						to approximate the generator of a gradient flow Markov process 
						where the gradient terms are not slaved to the sampling density,
						but are derived from a target probability measure that is chosen
						by the user and known up to a normalization constant. 
		
		LKDmap: local kernel diffusion maps, allows to approximate the forward and backward 
						Fokker–Planck operators of a large class of Ito diffusions
					
FlowVisualisation contains an example of an application of LKDmap to flow analysis. 				


