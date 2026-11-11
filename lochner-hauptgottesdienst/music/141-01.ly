\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 141, printed p. 116.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 170\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2 a'4 b'4 \bar "|" c''4 b'4 a'2 \bar "|" g'2 a'2 \bar "|" a'4 g'4 f'4( e'4) \bar "|" fis'2 g'2 \bar "||" }
      \new Voice { \voiceTwo c'2 c'4 d'4 e'4 e'4 e'4( d'4) b2 d'2 c'4 e'4 d'4( c'4) d'2 d'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t durch dein groß Barm -- her -- zig -- keit er -- barm dich ü -- \skip 1 ber "uns!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne e2 e4 g4 g4 g4 g4( fis4) g2 f!2 f4 c'4 a2 a2 b2 }
      \new Voice { \voiceTwo c2 a,4 g,4 c4 e4 c4( dis4) g,2 d!2 s4 c4 d4( a,4) d2 g,2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
