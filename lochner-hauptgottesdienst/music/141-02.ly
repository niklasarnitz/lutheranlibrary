\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 141, printed p. 116.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 170\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2 b'4( c''4 \bar "|" d''4 c''4 d''2) \bar "|" g'2 \bar "|" c''4 b'4 a'4 a'4 \bar "|" g'2 \bar "|" r4 g'4 g'4 g'4 }
      \new Voice { \voiceTwo d'2. e'4( f'4 g'4 f'2) e'2 e'4 e'4 e'4 d'4 b2 s4 e'4 d'4 e'4 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t O Chri -- \skip 1 \skip 1 \skip 1 \skip 1 "ste," wollst uns er -- hö -- "ren," für uns bist }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b2. g4( a4 c'4 b2) c'2 a4 g4. g8 fis4 g2 r4 g4 g4 g4 }
      \new Voice { \voiceTwo g2. e4( d4 e4 d2) c2 a,4 b,4 c4 dis4 e2 s4 c4 b,4 c4 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
