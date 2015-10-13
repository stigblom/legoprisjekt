function IntVerdiNy = EulerForover(IntVerdiGml, integrand, tidsskritt)
    IntVerdiNy =  IntVerdiGml + integrand * tidsskritt; % numerisk integrerer
end
