\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 141, printed p. 116.
% The lower bass on “ben” is obscured by scan-edge ink and is left open.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 190\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'4 g'4 a'4 b'4 \bar "|" c''4 b'4 a'2 \bar "|" g'2 \bar "|" a'2 b'2 \bar "|" e'4 e'4 f'4 e'4 \bar "|" d'2 \bar "|" c'4 s4 }
      \new Voice { \voiceTwo d'4 e'4 fis'4 g'4 e'4 d'4 e'4( d'4) d'2 d'2 d'2 c'4 c'4 c'4. c'8 b2 e'4 s4 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t O Heil -- ger "Geist," wollst uns ge -- "ben," dich all -- zeit herz -- lich zu lie -- ben }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b4 b4 d'4 d'4 c'4 g2 fis4 g2 fis!2 g2 a4 g4 a4 g4 g2 g2 }
      \new Voice { \voiceTwo g4 e4 d4 g,4 a,4 b,4 c4( dis4) g,2 dis!2 b,2 a,4 c4 f,4 c4 g,2 s2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
